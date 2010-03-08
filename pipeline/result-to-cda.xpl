<?xml version="1.0"?>
<p:declare-step version="1.0" 
    xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:c="http://www.w3.org/ns/xproc-step" 
    xmlns:cda="urn:hl7-org:v3" 
    xmlns:hdata="http://projecthdata.org/hdata"
    type="hdata:result-to-cda">
  <p:input port="source"/>
  <p:output port="result" sequence="true"/>
  <p:option name="sourceFolder" required="true"/>
  
  <p:directory-list name="find-results">
    <p:with-option name="path" select="$sourceFolder">
        <p:empty/>
    </p:with-option>
  </p:directory-list>
  <p:for-each name="translate-results">
      <p:iteration-source select="//c:file"/>
      <p:variable name="fileName" select="c:file/@name"/>
      <p:load>
          <p:with-option name="href" select="concat($sourceFolder,$fileName)">
              <p:empty/>
          </p:with-option>
      </p:load>
      <p:xslt>
        <p:input port="stylesheet">
          <p:document href="xslt/result-to-cda.xslt"/>
        </p:input>
        <p:input port="parameters" sequence="true">
          <p:empty/>
        </p:input>
      </p:xslt>
  </p:for-each>
  <p:filter select="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component" name="filter-result"/>
</p:declare-step>