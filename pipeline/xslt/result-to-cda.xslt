<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2010

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://projecthdata.org/hdata/schemas/2009/06/result" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="ns0 xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="var1_instance_result" select="."/>
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">
				<xsl:value-of select="'urn:hl7-org:v3 Z:/projects/hl7-tsc-project/l32-schemas/L32_ClinicalDocument.xsd'"/>
			</xsl:attribute>
			<component>
				<structuredBody>
					<component>
						<section>
							<templateId>
								<xsl:attribute name="root" namespace="">
									<xsl:value-of select="'2.16.840.1.113883.10.20.1.14'"/>
								</xsl:attribute>
								<xsl:attribute name="assigningAuthorityName" namespace="">
									<xsl:value-of select="'HL7'"/>
								</xsl:attribute>
							</templateId>
							<templateId>
								<xsl:attribute name="root" namespace="">
									<xsl:value-of select="'2.16.840.1.113883.10.20.15.2.6'"/>
								</xsl:attribute>
								<xsl:attribute name="assigningAuthorityName" namespace="">
									<xsl:value-of select="'HL7'"/>
								</xsl:attribute>
							</templateId>
							<title>
								<xsl:value-of select="'Relevant diagnostic tests and/or laboratory data'"/>
							</title>
							<entry>
								<organizer>
									<xsl:attribute name="classCode" namespace="">
										<xsl:value-of select="'BATTERY'"/>
									</xsl:attribute>
									<xsl:attribute name="moodCode" namespace="">
										<xsl:value-of select="'EVN'"/>
									</xsl:attribute>
									<templateId>
										<xsl:attribute name="root" namespace="">
											<xsl:value-of select="'2.16.840.1.113883.10.20.1.32'"/>
										</xsl:attribute>
										<xsl:attribute name="assigningAuthorityName" namespace="">
											<xsl:value-of select="'HL7'"/>
										</xsl:attribute>
									</templateId>
									<templateId>
										<xsl:attribute name="root" namespace="">
											<xsl:value-of select="'2.16.840.1.113883.10.20.15.3.21'"/>
										</xsl:attribute>
										<xsl:attribute name="assigningAuthorityName" namespace="">
											<xsl:value-of select="'HL7'"/>
										</xsl:attribute>
									</templateId>
									<component>
										<observation>
											<xsl:attribute name="classCode" namespace="">
												<xsl:value-of select="'OBS'"/>
											</xsl:attribute>
											<xsl:attribute name="moodCode" namespace="">
												<xsl:value-of select="'EVN'"/>
											</xsl:attribute>
											<templateId>
												<xsl:attribute name="root" namespace="">
													<xsl:value-of select="'2.16.840.1.113883.10.20.15.3.13'"/>
												</xsl:attribute>
												<xsl:attribute name="assigningAuthorityName" namespace="">
													<xsl:value-of select="'HL7'"/>
												</xsl:attribute>
											</templateId>
											<templateId>
												<xsl:attribute name="root" namespace="">
													<xsl:value-of select="'2.16.840.1.113883.10.20.1.31'"/>
												</xsl:attribute>
												<xsl:attribute name="assigningAuthorityName" namespace="">
													<xsl:value-of select="'HL7'"/>
												</xsl:attribute>
											</templateId>
											<id>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var2_result" select="."/>
													<xsl:if test="$var2_result/ns0:resultId/@root">
														<xsl:attribute name="root" namespace="">
															<xsl:value-of select="string($var2_result/ns0:resultId/@root)"/>
														</xsl:attribute>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var4_result" select="."/>
													<xsl:if test="$var4_result/ns0:resultId/@extension">
														<xsl:attribute name="extension" namespace="">
															<xsl:value-of select="string($var4_result/ns0:resultId/@extension)"/>
														</xsl:attribute>
													</xsl:if>
												</xsl:for-each>
											</id>
											<code>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var6_result" select="."/>
													<xsl:attribute name="code" namespace="">
														<xsl:value-of select="string($var6_result/ns0:resultType/@code)"/>
													</xsl:attribute>
												</xsl:for-each>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var8_result" select="."/>
													<xsl:if test="$var8_result/ns0:resultType/@displayName">
														<xsl:attribute name="displayName" namespace="">
															<xsl:value-of select="string($var8_result/ns0:resultType/@displayName)"/>
														</xsl:attribute>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var10_result" select="."/>
													<xsl:if test="$var10_result/ns0:resultType/@codeSystemName">
														<xsl:attribute name="codeSystemName" namespace="">
															<xsl:value-of select="string($var10_result/ns0:resultType/@codeSystemName)"/>
														</xsl:attribute>
													</xsl:if>
												</xsl:for-each>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var12_result" select="."/>
													<xsl:attribute name="codeSystem" namespace="">
														<xsl:value-of select="string($var12_result/ns0:resultType/@codeSystem)"/>
													</xsl:attribute>
												</xsl:for-each>
											</code>
											<statusCode>
												<xsl:for-each select="$var1_instance_result/ns0:result">
													<xsl:variable name="var14_result" select="."/>
													<xsl:if test="$var14_result/ns0:resultStatus/@code">
														<xsl:attribute name="code" namespace="">
															<xsl:value-of select="string($var14_result/ns0:resultStatus/@code)"/>
														</xsl:attribute>
													</xsl:if>
												</xsl:for-each>
											</statusCode>
											<effectiveTime>
												<low>
													<xsl:for-each select="$var1_instance_result/ns0:result">
														<xsl:variable name="var16_result" select="."/>
														<xsl:attribute name="value" namespace="">
															<xsl:value-of select="concat(concat(concat(concat(substring(string($var16_result/ns0:resultDateTime/@low), 1, 4), substring(string($var16_result/ns0:resultDateTime/@low), 6, 2)), substring(string($var16_result/ns0:resultDateTime/@low), 9, 2)), substring(string($var16_result/ns0:resultDateTime/@low), 12, 2)), substring(string($var16_result/ns0:resultDateTime/@low), 15, 2))"/>
														</xsl:attribute>
													</xsl:for-each>
												</low>
												<high>
													<xsl:for-each select="$var1_instance_result/ns0:result">
														<xsl:variable name="var18_result" select="."/>
														<xsl:if test="$var18_result/ns0:resultDateTime/@high">
															<xsl:attribute name="value" namespace="">
																<xsl:value-of select="concat(concat(concat(concat(substring(string($var18_result/ns0:resultDateTime/@high), 1, 4), substring(string($var18_result/ns0:resultDateTime/@high), 6, 2)), substring(string($var18_result/ns0:resultDateTime/@high), 9, 2)), substring(string($var18_result/ns0:resultDateTime/@high), 12, 2)), substring(string($var18_result/ns0:resultDateTime/@high), 15, 2))"/>
															</xsl:attribute>
														</xsl:if>
													</xsl:for-each>
												</high>
											</effectiveTime>
										</observation>
									</component>
								</organizer>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
