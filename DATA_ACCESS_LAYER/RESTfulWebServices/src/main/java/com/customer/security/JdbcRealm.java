package com.customer.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.config.ConfigurationException;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.JdbcUtils;

public class JdbcRealm extends org.apache.shiro.realm.jdbc.JdbcRealm {
	
	private static final Logger logger = Logger.getLogger(JdbcRealm.class);
	
	public JdbcRealm() {
		super();
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();

        // Null username is invalid
        if (username == null) {
            throw new AccountException("Null usernames are not allowed by this realm.");
        }

        Connection conn = null;
        SimpleAuthenticationInfo info = null;
        try {
            conn = dataSource.getConnection();
            UsernamePasswordSaltToken details = getCredentials(conn, username);
            if(null == details){
            		throw new Exception("Unknown user: " + username);	
            }
            String password = null;
            String salt = null;
            switch (saltStyle) {
            case NO_SALT:
                password = details.getPassword();//getPasswordForUser(conn, username)[0];
                break;
            case CRYPT:
                // TODO: separate password and hash from getPasswordForUser[0]
                throw new ConfigurationException("Not implemented yet");
                //break;
            case COLUMN:
                //String[] queryResults = getPasswordForUser(conn, username);
                password = details.getPassword();
                salt = details.getSalt();
                break;
            case EXTERNAL:
                password = details.getPassword();
                salt = getSaltForUser(username);
            }

            if (password == null) {
                throw new UnknownAccountException("No account found for user [" + username + "]");
            }

            UserPrincipal principal = new UserPrincipal(details.getUserId(), username, details.getClient_id(),details.getSec_user_id());
            info = new SimpleAuthenticationInfo(principal, password.toCharArray(), getName());
            
            if (salt != null) {
                info.setCredentialsSalt(ByteSource.Util.bytes(salt));
            }

        } catch (Exception e) {
            final String message = "There was a SQL error while authenticating user [" + username + "]";
            logger.error(e.getMessage());

            // Rethrow any SQL errors as an authentication exception
            throw new AuthenticationException(message, e);
        } finally {
            JdbcUtils.closeConnection(conn);
        }

        return info;
	}
	
	private UsernamePasswordSaltToken getCredentials(Connection conn, String username){
		//select a.member_id, a.user_password, a.user_passsalt, b.client_master_id from sec_user a, payroll_bd.member b where a.user_loginname = 'junie.bonifacio@gmail.com' and a.member_id = b.id;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		UsernamePasswordSaltToken token = null;
		try {
			stmt = conn.prepareStatement(authenticationQuery);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if(rs.next()){
				token = new UsernamePasswordSaltToken(rs.getString(1), username, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			if(null != rs){
				try {
					rs.close();
				} catch(Exception e){
					e.printStackTrace();
				}
			}
			
			if(null != stmt){
				try {
					stmt.close();
				} catch(Exception e){
					e.printStackTrace();
				}
			}
			
		}
		
		return token;
	}
	
	@Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        //null usernames are invalid
        if (principals == null) {
            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
        }

        //String username = (String) getAvailablePrincipal(principals);
        UserPrincipal up = (UserPrincipal) getAvailablePrincipal(principals);
        String username = up.getEmail();
        
        Connection conn = null;
        Set<String> roleNames = null;
        Set<String> permissions = null;
        try {
            conn = dataSource.getConnection();

            // Retrieve roles and permissions from database
            roleNames = getRoleNamesForUser(conn, username);
            if (permissionsLookupEnabled) {
                permissions = getPermissions(conn, username, roleNames);
            }

        } catch (SQLException e) {
            final String message = "There was a SQL error while authorizing user [" + username + "]";
            logger.error(e.getMessage());

            // Rethrow any SQL errors as an authorization exception
            throw new AuthorizationException(message, e);
        } finally {
            JdbcUtils.closeConnection(conn);
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
        info.setStringPermissions(permissions);
        return info;

    }
}
