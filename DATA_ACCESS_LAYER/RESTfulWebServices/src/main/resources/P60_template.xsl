<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output indent="yes"></xsl:output>
	<xsl:strip-space elements="*"></xsl:strip-space>

	<xsl:variable name="deductions">
		<xsl:value-of
			select="format-number(number(//GrossIncome)*0.232086833 + 581.30 + 437.50 + 100, '##,###.00')" />
	</xsl:variable>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simple"
					page-height="29.6926cm" page-width="20.9804cm" margin-top="0cm"
					margin-bottom="0cm" margin-left="1cm" margin-right="1cm">
					<fo:region-body margin-top="0.75cm" margin-bottom="0.75cm"
						background-color="#FFCC99"></fo:region-body>
					<fo:region-before extent="2cm"></fo:region-before>
					<fo:region-after extent="2cm"></fo:region-after>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simple">
				<fo:flow flow-name="xsl-region-body" text-align="center"
					font-size="12mm">
					<fo:table font-size="12" padding="4mm">
						<fo:table-column column-width="7.5cm" />
						<fo:table-column column-width="11.5cm" />
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell background-color="#FFFFFF">
									<fo:block>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block padding-left="1mm">
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-bottom="1mm" padding-left="1mm"
									padding-right="1mm" padding-top="2mm">
									<fo:block padding-bottom="2mm" padding-top="2mm"
										background-color="#FFFFFF" font-size="12" font-weight="bold"
										font-style="italic" color="#00457C">P60 End of Year Certificate
									</fo:block>
									<fo:block padding-bottom="2mm" padding-top="2mm"
										background-color="#EC6915" font-size="12" font-weight="bold"
										color="white">
										Tax year to 5 April &#160; &#160;
										<fo:inline background-color="#FFFFFF" color="#00457C"
											width="30mm" padding-top="1mm" padding-bottom="1mm"
											padding-left="5mm" padding-right="2mm">
											&#160;<xsl:value-of select="P60/taxYear"></xsl:value-of>
										</fo:inline>
									</fo:block>
									
									<fo:block background-color="#FFFFFF" text-align="center"
										font-weight="bold" font-size="10" padding-top="1mm" margin-top="2mm"
										padding-bottom="1mm"> This is a printed copy of an eP60</fo:block>
									<fo:block-container background-color="#FFFFFF">
										<fo:block text-align="left"
											font-weight="bold" font-size="12" color="#00457C"
											padding-bottom="1mm" margin-left="1mm">To the employee:</fo:block>
									</fo:block-container>
									<fo:block-container background-color="#FFFFFF">
										<fo:block
											linefeed-treatment="preserve" text-align="left" font-size="8"
											color="#00457C" padding-bottom="1mm" margin-left="1mm">Please keep this certificate in a safe place as you will
											need it if you have to fill in a tax return. You also need it
											to make a claim for tax credits or to renew your claim.
	
											It also helps you check that your employer is using the
											correct National Insurance number and deducting the
											right rate of National Insurance contributions.
										</fo:block>
									</fo:block-container>
									<fo:block-container background-color="#FFFFFF">
										<fo:block
											linefeed-treatment="preserve" text-align="left" font-size="8"
											color="#00457C" padding-bottom="1mm" font-weight="bold" margin-left="1mm">
											By law you are required to tell HM Revenue &#38;
											Customs about any income that is not fully taxed,
											even if you are not sent a tax return.
											
										</fo:block>
									</fo:block-container>
									<fo:block background-color="#FFFFFF" text-align="right"
										font-size="10" padding-top="1mm" color="#00457C"
										padding-bottom="1mm" font-weight="bold"
										font-style="italic">
										HM Revenue &#38; Customs
									</fo:block>
									<fo:block background-color="#00457C"
										linefeed-treatment="preserve" text-align="center" font-size="9"
										color="#FFFFFF" padding-bottom="2mm" padding-top="2mm" margin-top="5mm" font-style="italic" margin-left="2mm">The figures marked <fo:inline font-size="15">*</fo:inline> should be used for
										your tax return, if you get one
									</fo:block>
									
								</fo:table-cell>
								<fo:table-cell padding-bottom="1mm"
									padding-left="3mm" padding-top="0.2mm">
									<fo:block text-align="left" background-color="#EC6915"
										font-size="12" padding-top="1mm" padding-bottom="1mm"
										padding-left="1mm" color="white" font-weight="bold">Employee's
										details
									</fo:block>
									<fo:block>
										<fo:table>
											<fo:table-column column-width="3.8cm"/>
											<fo:table-column column-width="7.2cm"/>
											<fo:table-body>
												<fo:table-row>
													<fo:table-cell padding-left="5mm">
														<fo:block text-align="left" color="#00457C" font-size="9" padding-top="3mm">
															Surname
														</fo:block>
													</fo:table-cell>
													<fo:table-cell>
														<fo:block text-align="left" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" margin-left="1.5mm" margin-right="1.5mm" margin-top="1.5mm" padding-left="1mm" padding-right="1mm" padding-bottom="1mm"> 
															<xsl:value-of select="P60/surname"></xsl:value-of>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell padding-left="5mm">
														<fo:block text-align="left" color="#00457C" font-size="9" padding-top="2mm">
															Forenames or initials
														</fo:block>
													</fo:table-cell>
													<fo:table-cell>
														<fo:block text-align="left" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" margin-left="1.5mm" margin-right="1.5mm" padding-left="1mm" padding-right="1mm" padding-bottom="1mm"> 
															<xsl:value-of select="P60/forenames"></xsl:value-of>
														</fo:block>
													</fo:table-cell>
													
												</fo:table-row>
												
											</fo:table-body>
										</fo:table>
									</fo:block>
									<fo:table>
										<fo:table-column column-width="5cm" />
										<fo:table-column column-width="6cm" />
										<fo:table-header>
											<fo:table-row>
												<fo:table-cell background-color="#FFFFFF">
													<fo:block>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block padding-left="1mm">
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-header>
										<fo:table-body>
											<fo:table-row>
											<fo:table-cell padding-left="5mm">
												<fo:block text-align="left" color="#00457C" font-size="9" padding-top="1mm" >
													National Insurance number
												</fo:block>
												<fo:block text-align="left" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" padding-left="1mm" padding-right="1mm" padding-bottom="1mm"> 
															<xsl:value-of select="P60/niNumber"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
												<fo:table-cell padding-left="5mm">
												<fo:block text-align="left" color="#00457C" font-size="9" padding-top="1mm" >
													Works/payroll number
												</fo:block>
												<fo:block text-align="left" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" padding-left="1mm" padding-right="1mm" padding-bottom="1mm" margin-right="1.5mm"> 
															&#160;<xsl:value-of select="P60/workPayrollNumber"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
									<fo:block text-align="left" background-color="#EC6915"
										font-size="12" padding-top="1mm"
										padding-left="1mm" color="white" font-weight="bold" margin-top="2mm">
										Pay and Income Tax details
									</fo:block>
									<fo:table>
										<fo:table-column column-width="2.5cm" />
										<fo:table-column column-width="0.6cm" />
										<fo:table-column column-width="4cm" />
										<fo:table-column column-width="4cm" />
										<fo:table-header>
											<fo:table-row>
												<fo:table-cell>
													<fo:block>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block padding-top="1mm" text-align="left" margin-left="2mm" 
													padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Pay
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block padding-top="1mm" text-align="left" margin-left="2mm" 
													padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Tax deducted
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-header>
										<fo:table-body>
											<fo:table-row>
												<fo:table-cell>
													<fo:block>
													
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block>
													
													</fo:block>
												</fo:table-cell>
												<fo:table-cell padding-top="2mm">
													<fo:block color="#00457C" text-align="left" margin-top="1mm" font-size="9" margin-left="18mm">
														&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
													</fo:block>
												</fo:table-cell>
												<fo:table-cell padding-top="2mm">
													<fo:block color="#00457C" text-align="left" margin-top="1mm" font-size="9" margin-left="18mm">
														&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											
											<fo:table-row>
												<fo:table-cell>
													<fo:block font-size="9" color="#00457C" text-align="left" margin-left="3mm">
														In previous employment(s)
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
												<fo:block></fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" margin-left="1mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/previousEmploymentPay"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" margin-left="1mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/previousEmploymentTax"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row>
												<fo:table-cell>
													<fo:block>
													
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="center" font-size="8" color="#00457C">
														
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="center" font-size="8" color="#00457C">
														
													</fo:block>
												</fo:table-cell>
												<fo:table-cell padding-top="2mm">
													<fo:block text-align="right" font-size="8" color="#00457C" font-style="italic" margin-right="2mm">
														If refunded mark 'R'
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row>
												<fo:table-cell>
													<fo:block font-size="9" color="#00457C" text-align="left" margin-left="3mm">
														In this employment
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
												<fo:block background-image="/opt/customer/p60/image/test_asterisk.jpeg" 
												  padding-top="3.7mm" padding-bottom="2mm">
												&#160;
												</fo:block>
												</fo:table-cell>
												<fo:table-cell>
														<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" border-right-width="1mm"
														 border-right-style="solid"  border-right-color="#00457C" border-top-width="2mm" border-bottom-width="2mm"
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/thisEmploymentPay"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
														<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" border-bottom-width="2mm"
														 border-left-style="solid"  border-left-color="#00457C" border-top-width="2mm" border-right-width="1mm"
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" padding-top="2mm" margin-left="1mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/thisEmploymentTax"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											
											<fo:table-row >
												<fo:table-cell >
													<fo:block font-size="9" color="#00457C" text-align="left" padding-top="5mm" margin-top="3mm" margin-left="3mm">
														Total for year
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block></fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block  text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" margin-top="5mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/totalPayForYear"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" margin-top="5mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/totalTaxForYear"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											
											<fo:table-row >
												<fo:table-cell >
													<fo:block>
														
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block></fo:block>
												</fo:table-cell>
												<fo:table-cell >
													<fo:block font-size="9" color="#00457C" text-align="right" margin-right="2mm" padding-left="2mm" padding-top="5mm" margin-top="3mm">
														Final tax code
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="left" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" margin-top="5mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" padding-left="2mm" padding-right="1mm" padding-bottom="1mm" margin-bottom="2mm">
														<xsl:value-of select="P60/finalTaxCode"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
								</fo:table-cell>


							</fo:table-row>
							
						</fo:table-body>
					</fo:table>
					
					<!-- 
					
					
					DIVIDER!
					
					
					 -->
					 <fo:block-container background-color="#EC6915">
					<fo:block text-align="left" 
										font-size="12" padding-top="1mm"
										color="white" font-weight="bold" margin-top="2mm" margin-left="1mm" >
										National Insurance contributions in this employment
					</fo:block>
					</fo:block-container>
					
					<fo:table>
						<fo:table-column column-width="1.5cm" />
						<fo:table-column column-width="3cm" />
						<fo:table-column column-width="3cm" />
						<fo:table-column column-width="3.7cm" />
						<fo:table-column column-width="3.5cm" />
						<fo:table-column column-width="4cm" />
						<fo:table-header>
							<fo:table-row>
					
												<fo:table-cell>
													<fo:block margin-left="2mm" padding-top="1mm" text-align="left" padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													NIC table letter
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block margin-left="2mm" padding-top="1mm" text-align="left" padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Earnings at the Lower Earnings Limit (LEL) (where earnings are equal to or exceed the LEL)
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block margin-left="2mm" padding-top="1mm" text-align="left" padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Earnings above the LEL, up to and including the Primary Threshold (PT)
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block margin-left="2mm" padding-top="1mm" text-align="left" padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Earnings above the PT, up to and including the Upper Accrual Point (UAP)
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block margin-left="2mm" padding-top="1mm" text-align="left" padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Earnings above the UAP, up to and including the Upper Earnings Limit(UEL)
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block margin-left="2mm" padding-top="1mm" text-align="left" padding-left="1mm" color="#00457C" font-weight="bold" font-size="9">
													Employee's contributions due on all earnings above the PT
													</fo:block>
												</fo:table-cell>
								</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								
								<fo:table-cell>
									<fo:block>
										
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block color="#00457C" text-align="center" padding-top="2mm" font-size="9">
										&#163;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block color="#00457C" text-align="center" padding-top="2mm" font-size="9">
										&#163;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block color="#00457C" text-align="center" padding-top="2mm" font-size="9">
										&#163;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block color="#00457C" text-align="center" padding-top="2mm" font-size="9">
										&#163;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block color="#00457C" text-align="left" padding-top="2mm" font-size="9" margin-left="17mm">
										&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="center" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 margin-top="1mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/nicTableLetter1"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>
									<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 margin-top="1mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lel1"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 margin-top="1mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lelToPT1"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 margin-top="1mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/ptToUAP1"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 margin-top="1mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/uapToLel1"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 margin-top="1mm" padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/abovePT1"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
							<!-- 
							
							
							Second ROOOOOW!
							
							
							 -->
							<fo:table-row>
							
								<fo:table-cell>
									<fo:block text-align="center" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/nicTableLetter2"></xsl:value-of>

													</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lel2"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">	
														 &#160;<xsl:value-of select="P60/lelToPT2"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/ptToUAP2"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/uapToLel2"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/abovePT2"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<!-- 
							
							
							Third row
							
							
							 -->
							 <fo:table-row>
							
								<fo:table-cell>
									<fo:block text-align="center" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/nicTableLetter3"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lel3"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lelToPT3"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/ptToUAP3"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/uapToLel3"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/abovePT3"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<!-- 
							
							
							FOURTH ROW
							
							
							 -->
							 <fo:table-row>
							
								<fo:table-cell>
									<fo:block text-align="center" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/nicTableLetter4"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lel4"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/lelToPT4"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/ptToUAP4"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/uapToLel4"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" color="#00457C" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-left="1mm" margin-right="2mm" 
														 padding-left="3mm" padding-right="3mm" padding-bottom="2mm">
														&#160;<xsl:value-of select="P60/abovePT4"></xsl:value-of>
													</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					
					<fo:table>
						<fo:table-column column-width="9.5cm" />
						<fo:table-column column-width="9.5cm" />
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:table>
										<fo:table-column column-width="4cm" />
										<fo:table-column column-width="2cm" />
										<fo:table-column column-width="3cm" />
										<fo:table-header>
											<fo:table-row>
												<fo:table-cell><fo:block></fo:block></fo:table-cell>
												<fo:table-cell><fo:block></fo:block></fo:table-cell>
												<fo:table-cell>
													<fo:block color="#00457C" text-align="left" margin-top="2mm" font-size="9" margin-left="7mm">
														&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-header>
										 <fo:table-body>
										 	<fo:table-row>
										 		<fo:table-cell>
										 		<fo:block-container background-color="#EC6915">
										 			<fo:block font-size="9" text-align="left" 
													 padding-top="1mm" color="white" font-weight="bold" padding-bottom="4mm" padding-right="1mm" margin-top="1mm" margin-left="1mm">
										 				<fo:inline font-size="10">Statutory Payments</fo:inline> included in the pay 'In this employment' figure above 
										 			</fo:block>
										 		</fo:block-container>
										 		</fo:table-cell>
										 		<fo:table-cell>
										 			<fo:block margin-left="2mm" font-size="9" color="#00457C" text-align="left" padding-top="1mm">
										 				Statutory Maternity Pay
										 			</fo:block>
										 			<fo:block margin-left="2mm" font-size="9" color="#00457C" text-align="left" padding-top="1mm">
										 				Statutory Adoption Pay
										 			</fo:block>
										 		</fo:table-cell>
										 		<fo:table-cell>
										 			<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm" margin-right="2mm" margin-top="1mm"
														 padding-left="3mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/statutoryMaternityPay"></xsl:value-of>
													</fo:block>
													<fo:block color="#00457C" text-align="left" margin-top="1mm" font-size="9" margin-left="7mm">
														&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
													</fo:block>
													<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm"  margin-right="2mm" margin-top="1mm"
														 padding-left="3mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/statutoryAdoptionPay"></xsl:value-of>
													</fo:block>
										 		</fo:table-cell>
										 	</fo:table-row>
										 </fo:table-body>
									</fo:table>
									
									<fo:block-container background-color="#EC6915" margin-right="7mm">
										<fo:block font-size="10" text-align="left" 
										padding-top="1mm" color="white" font-weight="bold" padding-bottom="1mm" padding-right="1mm" 
										margin-top="1mm" margin-right="7mm" margin-left="1mm">
										Other details 
										</fo:block>
									</fo:block-container>
									<fo:table>
										<fo:table-column column-width="4.5cm"/>
										<fo:table-column column-width="4.5cm"/>
									
										<fo:table-body>
											<fo:table-row>
												<fo:table-cell>
													<fo:block font-size="8" color="#00457C" linefeed-treatment="preserve" text-align="left" margin-left="5mm">
														<fo:inline font-weight="bold" font-size="9">Student Loan deductions</fo:inline> 
														in this employment 
														<fo:inline font-style="italic">(whole £ only)</fo:inline>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
												<fo:block color="#00457C" text-align="center" margin-top="1mm" font-size="9" margin-left="7mm">
														&#163; 
													</fo:block>
													<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm"  margin-right="2mm"
														 margin-left="8mm"
														 padding-left="3mm" padding-right="1mm" padding-bottom="1mm">
														<xsl:value-of select="P60/studentLoanDeductions"></xsl:value-of>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
									<fo:block color="#00457C" font-weight="bold" font-size="10" text-align="left" margin-left="2mm" margin-top="5mm">
									To employee
									</fo:block>
									<fo:block-container background-color="#FFFFFF" margin-left="2mm" margin-right="7mm" height="35mm">
									<fo:block  font-size="10" text-align="left" linefeed-treatment="preserve" > 
										<xsl:value-of select="P60/employeeAddress"></xsl:value-of>
									</fo:block>
									</fo:block-container>
								</fo:table-cell>
								<fo:table-cell>
									<fo:table>
										<fo:table-column column-width="1.5cm" />
										<fo:table-column column-width="3cm" />
										<fo:table-column column-width="1.5cm" />
										<fo:table-column column-width="3cm" />
										<fo:table-header>
											<fo:table-row>
												<fo:table-cell>
													<fo:block></fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block color="#00457C" text-align="left" margin-top="2mm" font-size="9" margin-left="7mm">
														&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block></fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block color="#00457C" text-align="left" margin-top="2mm" font-size="9" margin-left="7mm">
														&#163; &#160; &#160; &#160; &#160; &#160; &#160; &#160; p
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</fo:table-header>
										<fo:table-body>
											<fo:table-row>
												<fo:table-cell>
													<fo:block margin-left="1mm" font-size="9" color="#00457C" text-align="left" padding-top="1mm">
										 				Ordinary Statutory Paternity Pay
										 			</fo:block>
										 		</fo:table-cell>
										 		<fo:table-cell>
										 			<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm"  margin-right="2mm" margin-left="2mm" margin-top="1mm"
														 padding-left="3mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/ordinaryStatutoryPaternityPay"></xsl:value-of>
													</fo:block>
										 		</fo:table-cell>
										 		<fo:table-cell>
										 			<fo:block margin-left="1mm" font-size="9" color="#00457C" text-align="left" padding-top="1mm">
										 				Additional Statutory Paternity Pay
										 			</fo:block>
										 		</fo:table-cell>
										 		<fo:table-cell>
										 			<fo:block text-align="right" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm"  margin-right="2mm" margin-left="2mm" margin-top="1mm"
														 padding-left="3mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/additionalStatutoryPaternityPay"></xsl:value-of>
													</fo:block>
										 		</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
									<fo:block color="#00457C" font-size="9" text-align="left"  border-top-style="solid" border-top-width="1mm"
									border-top-color="#00457C" margin-left="7mm" margin-top="2mm" font-weight="bold" padding-top="1mm">
										Your employer's full name and address <fo:inline font-size="6"> (including postcode)</fo:inline>
									</fo:block>
									<fo:block-container height="25mm" margin-top="2mm" margin-left="7mm" background-color="#FFFFFF" margin-right="2mm">
										<fo:block font-size="10" text-align="left" linefeed-treatment="preserve" margin-right="2mm" padding-left="1mm">
										<xsl:value-of select="concat(P60/employerFullname, '&#xA;', P60/employerAddress)"></xsl:value-of>
										
										</fo:block>
									</fo:block-container>
									
									<fo:table>
										<fo:table-column column-width="3.5cm"/>
										<fo:table-column column-width="6.0cm"/>
										<fo:table-body>
											<fo:table-row>
												<fo:table-cell>
													<fo:block linefeed-treatment="preserve" font-size="10" margin-top="2mm" color="#00457C" text-align="left"  margin-left="7mm">Employer 
														PAYE reference
													</fo:block>
												</fo:table-cell>
												<fo:table-cell>
													<fo:block text-align="left" font-size="9" background-color="#FFFFFF"
														 border-top-style="solid" border-top-color="#00457C" 
														 border-left-style="solid"  border-left-color="#00457C" 
														 border-right-style="solid"  border-right-color="#00457C" 
														 border-bottom-style="solid"  border-bottom-color="#00457C" 
														 padding-top="2mm"  margin-right="2mm" margin-left="2mm" margin-top="2mm"
														 padding-left="3mm" padding-right="1mm" padding-bottom="1mm">
														&#160;<xsl:value-of select="P60/payeReference"></xsl:value-of> 
													</fo:block>													
												</fo:table-cell>
											</fo:table-row>
										</fo:table-body>
									</fo:table>
									<fo:block  margin-left="7mm" margin-top="2mm" font-size="9" color="#00457C" text-align="left" linefeed-treatment="preserve"><fo:inline font-weight="bold" font-size="10"> Certificate by Employer/Paying Office:</fo:inline>
													This form shows your total pay Income Tax purposes
													in this employment for the year.
													Any overtime, bonus, commision etc, Statutory Sick Pay,
													Statutory Maternity Pay, Ordinary Statutory Paternity Pay,
													Additional Statutory Paternity Pay or Statutory Adoption
													Pay is included.												
													</fo:block>
									</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>



</xsl:stylesheet>