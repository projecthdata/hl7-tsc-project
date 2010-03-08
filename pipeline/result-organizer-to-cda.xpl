<?xml version="1.0"?>
<p:declare-step version="1.0" 
    xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:c="http://www.w3.org/ns/xproc-step" 
    xmlns:cda="urn:hl7-org:v3" 
    xmlns:hdata="http://projecthdata.org/hdata"
    xmlns:ro="http://projecthdata.org/hdata/schemas/2009/06/result_organizer"
    type="hdata:result-organizer-to-cda"
    name="result-organizer-to-cda">
  <p:input port="source"/>
  <p:output port="result" sequence="true"/>
  <p:option name="sourceFolder" required="true"/>
  <p:import href="result-to-cda.xpl"/>
  
  <p:directory-list name="find-result-organizers">
    <p:with-option name="path" select="$sourceFolder">
        <p:empty/>
    </p:with-option>
  </p:directory-list>
  <p:for-each name="translate-result-organizers">
      <p:iteration-source select="//c:file"/>
      <p:variable name="fileName" select="c:file/@name"/>
      <p:load name="organizer-file">
          <p:with-option name="href" select="concat($sourceFolder,$fileName)">
              <p:empty/>
          </p:with-option>
      </p:load>
      
      <hdata:result-to-cda name="result-to-cda">
          <p:with-option name="sourceFolder" select="concat(concat($sourceFolder,/ro:resultOrganizer/ro:organizerId/@root), '/')"/>
      </hdata:result-to-cda>
      
      <p:xslt>
        <p:input port="source">
          <p:pipe step="organizer-file" port="result"/>
        </p:input>
        <p:input port="stylesheet">
          <p:document href="xslt/result-organizer-to-cda.xslt"/>
        </p:input>
        <p:input port="parameters" sequence="true">
          <p:empty/>
        </p:input>
      </p:xslt>
      
      <p:insert position="last-child" match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer">
          <p:input port="insertion">
              <p:pipe step="result-to-cda" port="result"/>
          </p:input>
      </p:insert>
  </p:for-each>
  <p:filter select="//cda:organizer" name="filter-result-organizers"/>
</p:declare-step>