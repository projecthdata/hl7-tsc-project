<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Copyright 2009 The MITRE Corporation
    Approved for Public Release: 09-3060. Distribution Unlimited.
    
    See L32_ClinicalDocument.xsd for license details
-->
<xsl:stylesheet 
    xmlns:L32="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="//L32:component/@xsi:type">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>       
    </xsl:template>
</xsl:stylesheet>
