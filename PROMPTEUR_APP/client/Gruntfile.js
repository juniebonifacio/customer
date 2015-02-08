module.exports = function (grunt) {

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-recess');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-testacular');
  grunt.loadNpmTasks('grunt-html2js');
  grunt.loadNpmTasks('grunt-combine');
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadTasks('build');

  // Default task.
  grunt.registerTask('default', ['jshint','build', 'combine:dev'/*,'testacular:unit', 'testacular:e2e'*/]);
  grunt.registerTask('prod', ['jshint','build', 'combine:prod', 'shell'/*,'testacular:unit', 'testacular:e2e'*/]);
  grunt.registerTask('build', ['clean','html2js','concat','recess:build','copy:assets']);
  grunt.registerTask('release', ['clean','html2js','uglify','jshint','testacular:unit','concat:index', 'recess:min','copy:assets','testacular:e2e']);
  grunt.registerTask('test-watch', ['testacular:watch']);

  // Print a timestamp (useful for when watching)
  grunt.registerTask('timestamp', function() {
    grunt.log.subhead(Date());
  });

  var testacularConfig = function(configFile, customOptions) {
    var options = { configFile: configFile, keepalive: true };
    var travisOptions = process.env.TRAVIS && { browsers: ['Firefox'], reporters: 'dots' };
    return grunt.util._.extend(options, customOptions, travisOptions);
  };

  // Project configuration.
  grunt.initConfig({
    distdir: 'dist',
    pkg: grunt.file.readJSON('package.json'),
    banner:
    '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %>\n' +
    '<%= pkg.homepage ? " * " + pkg.homepage + "\\n" : "" %>' +
    ' * Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author %>;\n' +
    ' * Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %>\n */\n',
    src: {
      js: ['src/**/*.js', '<%= distdir %>/templates/**/*.js'],
      specs: ['test/**/*.spec.js'],
      scenarios: ['test/**/*.scenario.js'],
      html: ['src/index.html'],
      tpl: {
        app: ['src/app/**/*.tpl.html'],
        common: ['src/common/**/*.tpl.html']
      },
      less: ['src/less/stylesheet.less'] // recess:build doesn't accept ** in its file patterns
    },
    clean: ['<%= distdir %>/*'],
    copy: {
      assets: {
        files: [{ dest: '<%= distdir %>', src : '**', expand: true, cwd: 'src/assets/' }]
      }
    },
    testacular: {
      unit: { options: testacularConfig('test/config/unit.js') },
      e2e: { options: testacularConfig('test/config/e2e.js') },
      watch: { options: testacularConfig('test/config/unit.js', { singleRun:false, autoWatch: true}) }
    },
    html2js: {
      app: {
        options: {
          base: 'src/app'
        },
        src: ['<%= src.tpl.app %>'],
        dest: '<%= distdir %>/templates/app.js',
        module: 'templates.app'
      },
      common: {
        options: {
          base: 'src/common'
        },
        src: ['<%= src.tpl.common %>'],
        dest: '<%= distdir %>/templates/common.js',
        module: 'templates.common'
      }
    },
    concat:{
      dist:{
        options: {
          banner: "<%= banner %>"
        },
        src:['<%= src.js %>'],
        dest:'<%= distdir %>/<%= pkg.tmp_name %>.js'
      },
      index: {
        src: ['src/index.html'],
        dest: '<%= distdir %>/index.html',
        options: {
          process: true
        }
      },
      notsupported: {
        src: ['src/notsupported.html'],
        dest: '<%= distdir %>/notsupported.html'
      },
      notsupported: {
        src: ['src/maintenance.html'],
        dest: '<%= distdir %>/maintenance.html'
      },
      angular: {
        src:['vendor/angular/angular.min.js'],
        dest: '<%= distdir %>/angular.js'
      },
      angularRoutes: {
        src:['vendor/angular/angular-route.js'],
        dest: '<%= distdir %>/angular-route.js'
      },
      arbor: {
    src:['vendor/arbor/arbor.js'],
    dest: '<%= distdir %>/arbor.js'
    },
      angularPlugins: {
        src:['vendor/angular-plugins/*.js'],
        dest: '<%= distdir %>/angular-plugins.js'
      },
      bootstrap: {
        src:['vendor/bootstrap/*.js'],
        dest: '<%= distdir %>/bootstrap.js'
      },
      fileUpload: {
        src:['vendor/file-upload/*.js'],
        dest: '<%= distdir %>/file-upload.js'
      },
      customAccordionBar: {
        src:['vendor/custom-accordion-bar/*.js'],
        dest: '<%= distdir %>/custom-accordion-bar.js'
      },
      mCustomScrollbar: {
        src:['vendor/custom-scrollbar/*.js'],
        dest: '<%= distdir %>/mCustomScrollbar.js'
      },
      wysiwyg: {
        src:['vendor/wysiwyg/*.js'],
        dest: '<%= distdir %>/wysiwyg.js'
      },
      select2: {
        src:['vendor/select2/*.js'],
        dest: '<%= distdir %>/select2.js'
      },
      jquery: { 
        src:['vendor/jquery/*.js'],
        dest: '<%= distdir %>/jquery.js'
      },
      jqueryMap: { 
        src:['vendor/jquery/*.js'],
        dest: '<%= distdir %>/jquery.min.map'
      },
      jqueryUi: { 
        src:['vendor/jquery-ui/*.js'],
        dest: '<%= distdir %>/jquery-ui.min.js'
      },
      jqueryTableSorter: { 
        src:['vendor/tablesorter/*.js'],
        dest: '<%= distdir %>/tablesorter.min.js'
      },
      shim: {
        src:['vendor/windows/es5-shim.min.js'],
        dest: '<%= distdir %>/es5-shim.min.js'
      },
      json3: {
        src:['vendor/windows/json3.min.js'],
        dest: '<%= distdir %>/json3.min.js'
      },
      autogrow: {
        src:['vendor/autogrow/*.js'],
        dest: '<%= distdir %>/autogrow-textarea.js'
      },
      html5shiv: {
        src:['vendor/html5shiv/html5shiv.js'],
        dest: '<%= distdir %>/html5shiv.js'
      },
      pageSlider: {
        src:['vendor/page-slider/page-slider.js'],
        dest: '<%= distdir %>/page-slider.js'
      },
      googleCharts: {
        src:['vendor/google-charts/jsapi.js'],
        dest: '<%= distdir %>/jsapi.js'
      },
      moment: {
        src: ['vendor/moment/moment.js'],
        dest: '<%= distdir %>/moment.js'
      },
      rGraph: {
        src: ['vendor/rGraph/*.js'],
        dest: '<%= distdir %>/rGraph.js'
      },
      d3: {
        src: ['vendor/d3/d3.js'],
        dest: '<%= distdir %>/d3.js'
      },
      d3cloud: {
        src: ['vendor/d3/d3.layout.cloud.js'],
        dest: '<%= distdir %>/d3.layout.cloud.js'
      },
       d3timeline: {
        src: ['vendor/d3timeline/*.js'],
        dest: '<%= distdir %>/d3timeline.js'
      },
      /*,
      socketio: {
        src:['vendor/socketio/lib/*.js'],
        dest: '<%= distdir %>/socket.io.js'
      }*/
    },
    uglify: {
      dist:{
        options: {
          banner: "<%= banner %>"
        },
        src:['<%= src.js %>'],
        dest:'<%= distdir %>/<%= pkg.name %>.js'
      },
      angular: {
        src:['vendor/angular/angular.js'],
        dest: '<%= distdir %>/angular.js'
      },
      angularPlugins: {
        src:['vendor/angular-plugins/*.js'],
        dest: '<%= distdir %>/angular-plugins.js'
      },
      bootstrap: {
        src:['vendor/bootstrap/*.js'],
        dest: '<%= distdir %>/bootstrap.js'
      },
      wysiwyg: {
        src:['vendor/wysiwyg/*.js'],
        dest: '<%= distdir %>/wysiwyg.js'
      },
      magicSuggest: {
        src:['vendor/magic-suggest/*.js'],
        dest: '<%= distdir %>/magic-suggest.js'
      },
      select2: {
        src:['vendor/select2/*.js'],
        dest: '<%= distdir %>/select2.js'
      },
      jquery: {
        src:['vendor/jquery/*.js'],
        dest: '<%= distdir %>/jquery.js'
      },
      shim: {
        src:['<%= concat.shim.src %>'],
        dest: '<%= distdir %>/es5-shim.min.js'
      },
      json3: {
        src:['<%= concat.json3.src %>'],
        dest: '<%= distdir %>/json3.min.js'
      }
    },
    recess: {
      build: {
        files: {
          '<%= distdir %>/<%= pkg.name %>.css':
          ['<%= src.less %>'] },
        options: {
          compile: true
        }
      },
      min: {
        files: {
          '<%= distdir %>/<%= pkg.name %>.css': ['<%= src.less %>']
        },
        options: {
          compress: true
        }
      }
    },
    watch:{
      files:['<%= src.js %>', '<%= test.unit %>', '<%= src.less =>', '<%= src.tpl %>', '<%= src.html %>'],
      tasks:'default timestamp'
    },
    jshint:{
      files:['grunt.js', '<%= src.js %>', '<%= src.specs %>', '<%= src.scenarios %>'],
      options:{
        curly:true,
        eqeqeq:true,
        immed:true,
        latedef:true,
        newcap:true,
        noarg:true,
        sub:true,
        boss:true,
        eqnull:true,
        globals:{}
      }
    },
    combine: {
		dev: {
		    input: "<%= distdir %>/solutio_app_tmp.js",
		    output: "<%= distdir %>/solutio_app.js",
		    tokens:[
			{
			    token: "@prod_env@",
			    string: "false"
			},
                {
                    token: "@google_auth@",
                    string: "https://accounts.google.com/o/oauth2/auth?client_id=727721466004-rsm45ejc0ulrgk94b46v007e80rdpuse.apps.googleusercontent.com&response_type=code&scope=openid%20profile%20email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fgoogle&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oa2cb.example.com/myHome&include_granted_scopes%3Dtrue"
                }
		    ]
		},
		prod: {
		    input: "<%= distdir %>/solutio_app_tmp.js",
		    output: "<%= distdir %>/solutio_app_tmp2.js",
		    tokens:[
			{
			    token: "@prod_env@",
			    string: "true"
			},
                {
                    token: "@google_auth@",
                    string: "https://accounts.google.com/o/oauth2/auth?client_id=727721466004-mlastb4858ojlr8k3gshh71rbg9me49b.apps.googleusercontent.com&response_type=code&scope=openid%20email&redirect_uri=http%3A%2F%2Fportal.uberito.com%2Fgoogle&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oa2cb.example.com/myHome"
                }
		    ]
		}

    },
    shell: {
        minify: {
            command: 'cd dist && java -jar ../compiler.jar --language_in ECMASCRIPT5 --logging_level FINE --compilation_level SIMPLE_OPTIMIZATIONS --js solutio_app_tmp2.js --js_output_file solutio_app.js'
        }
    }
  });

};
