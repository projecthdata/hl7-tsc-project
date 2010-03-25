<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2010

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ns0="urn:hl7-org:v3" exclude-result-prefixes="xs ns0">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="var1_instance_L32_ClinicalDocument" select="."/>
		<resultOrganizer xmlns="http://projecthdata.org/hdata/schemas/2009/06/result_organizer" xmlns:core="http://projecthdata.org/hdata/schemas/2009/06/core" xmlns:result="http://projecthdata.org/hdata/schemas/2009/06/result">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">
				<xsl:value-of select="'http://projecthdata.org/hdata/schemas/2009/06/result_organizer Z:/projects/hl7-tsc-project/hdata-schemas/result_organizer.xsd'"/>
			</xsl:attribute>
			<xsl:for-each select="$var1_instance_L32_ClinicalDocument/ns0:ClinicalDocument/ns0:component/ns0:structuredBody/ns0:component/ns0:section/ns0:entry/ns0:organizer">
				<xsl:variable name="var2_organizer" select="."/>
				<organizerId>
					<xsl:if test="$var2_organizer/ns0:id/@root">
						<xsl:attribute name="root" namespace="">
							<xsl:value-of select="string($var2_organizer/ns0:id/@root)"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$var2_organizer/ns0:id/@extension">
						<xsl:attribute name="extension" namespace="">
							<xsl:value-of select="string($var2_organizer/ns0:id/@extension)"/>
						</xsl:attribute>
					</xsl:if>
				</organizerId>
			</xsl:for-each>
			<xsl:for-each select="$var1_instance_L32_ClinicalDocument/ns0:ClinicalDocument/ns0:component/ns0:structuredBody/ns0:component/ns0:section/ns0:entry/ns0:organizer">
				<xsl:variable name="var4_organizer" select="."/>
				<statusCode>
					<xsl:if test="$var4_organizer/ns0:statusCode/@code">
						<xsl:attribute name="code" namespace="">
							<xsl:value-of select="string($var4_organizer/ns0:statusCode/@code)"/>
						</xsl:attribute>
					</xsl:if>
				</statusCode>
			</xsl:for-each>
			<xsl:for-each select="$var1_instance_L32_ClinicalDocument/ns0:ClinicalDocument/ns0:component/ns0:structuredBody/ns0:component/ns0:section/ns0:entry/ns0:organizer">
				<xsl:variable name="var6_organizer" select="."/>
				<code>
					<xsl:if test="$var6_organizer/ns0:code/@code">
						<xsl:attribute name="code" namespace="">
							<xsl:value-of select="string($var6_organizer/ns0:code/@code)"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$var6_organizer/ns0:code/@codeSystem">
						<xsl:attribute name="codeSystem" namespace="">
							<xsl:value-of select="string($var6_organizer/ns0:code/@codeSystem)"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$var6_organizer/ns0:code/@codeSystemName">
						<xsl:attribute name="codeSystemName" namespace="">
							<xsl:value-of select="string($var6_organizer/ns0:code/@codeSystemName)"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$var6_organizer/ns0:code/@displayName">
						<xsl:attribute name="displayName" namespace="">
							<xsl:value-of select="string($var6_organizer/ns0:code/@displayName)"/>
						</xsl:attribute>
					</xsl:if>
				</code>
			</xsl:for-each>
			<xsl:for-each select="$var1_instance_L32_ClinicalDocument/ns0:ClinicalDocument/ns0:component/ns0:structuredBody/ns0:component/ns0:section/ns0:entry/ns0:organizer">
				<xsl:variable name="var8_organizer" select="."/>
				<xsl:if test="$var8_organizer/ns0:effectiveTime/@value">
					<effectiveTime>
						<xsl:value-of select="concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(concat(substring(string($var8_organizer/ns0:effectiveTime/@value), 1, 4), '-'), substring(string($var8_organizer/ns0:effectiveTime/@value), 5, 2)), '-'), substring(string($var8_organizer/ns0:effectiveTime/@value), 7, 2)), 'T'), substring(concat(substring(string($var8_organizer/ns0:effectiveTime/@value), 9, 2), '00'), 1, 2)), ':'), substring(concat(substring(string($var8_organizer/ns0:effectiveTime/@value), 11, 2), '00'), 1, 2)), ':'), substring(concat(substring(string($var8_organizer/ns0:effectiveTime/@value), 13, 2), '00'), 1, 2)), 'Z')"/>
					</effectiveTime>
				</xsl:if>
			</xsl:for-each>
		</resultOrganizer>
	</xsl:template>
</xsl:stylesheet>