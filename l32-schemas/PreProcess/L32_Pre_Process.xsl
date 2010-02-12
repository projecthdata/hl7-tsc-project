<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Copyright 2009 The MITRE Corporation
    Approved for Public Release: 09-3060. Distribution Unlimited.
    
    See L32_ClinicalDocument.xsd for license details
-->
<xsl:stylesheet 
    xmlns:C32="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="//C32:structuredBody/C32:component" >
        <xsl:copy>
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.9'">
                <xsl:attribute name="xsi:type">InsuranceProviders</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.2'">
                <xsl:attribute name="xsi:type">Allergies</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.11'">
                <xsl:attribute name="xsi:type">Conditions</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.8'">
                <xsl:attribute name="xsi:type">Medications</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.1'">
                <xsl:attribute name="xsi:type">AdvanceDirectives</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.6'">
                <xsl:attribute name="xsi:type">Immunizations</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.16'">
                <xsl:attribute name="xsi:type">VitalSigns</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.14'">
                <xsl:attribute name="xsi:type">Results</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.3'">
                <xsl:attribute name="xsi:type">Encounters</xsl:attribute>
            </xsl:if>
            
            <xsl:if test="C32:section/C32:templateId/@root='2.16.840.1.113883.10.20.1.12'">
                <xsl:attribute name="xsi:type">Procedures</xsl:attribute>
            </xsl:if>
            
            <xsl:apply-templates select="@*|node()"/>
            
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
