<?xml version="1.0"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cda="urn:hl7-org:v3" xmlns:hdata="http://projecthdata.org/hdata" name="cda-to-hdata">
  <p:input port="source">
      <p:document href="../cda-examples/simple-example.xml"/>
  </p:input>
  <p:output port="result">
      <p:pipe step="transform-person-information" port="result"/>
  </p:output>
  
  <p:for-each name="each-result-organizer">
      <p:iteration-source select="//cda:organizer"/>
      <p:variable name="organizerId" select="//cda:organizer/cda:id/@root"/>
      <p:insert position="last-child" match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry">
          <p:input port="source">
              <p:document href="StubCDA.xml"/>
          </p:input>
          <p:input port="insertion">
              <p:pipe step="each-result-organizer" port="current"/>
          </p:input>
      </p:insert>
      <p:xslt name="translate-result-organizers">
        <p:input port="stylesheet">
          <p:document href="xslt/cda-to-result-organizer.xslt"/>
        </p:input>
        <p:input port="parameters" sequence="true">
          <p:empty/>
        </p:input>
      </p:xslt>
      <p:store>
        <p:with-option name="href" select="concat(concat('tmp-hdata/result_organizers/',$organizerId), '.xml')">
            <p:empty/>
        </p:with-option>
      </p:store>
      
      <p:filter select="//cda:component">
          <p:input port="source">
              <p:pipe step="each-result-organizer" port="current"/>
          </p:input>
      </p:filter>
      <p:for-each name="each-result">
          <p:variable name="resultId" select="//cda:component/cda:observation/cda:id/@root"/>
          <p:insert position="last-child" match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry">
              <p:input port="source">
                  <p:document href="StubCDA.xml"/>
              </p:input>
              <p:input port="insertion">
                  <p:inline>
                      <cda:organizer/>
                  </p:inline>
              </p:input>
          </p:insert>
          <p:insert position="last-child" match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer">
              <p:input port="insertion">
                  <p:pipe step="each-result" port="current"/>
              </p:input>
          </p:insert>
          
          <p:xslt name="translate-result">
            <p:input port="stylesheet">
              <p:document href="xslt/cda-to-result.xslt"/>
            </p:input>
            <p:input port="parameters" sequence="true">
              <p:empty/>
            </p:input>
          </p:xslt>
          <p:store>
            <p:with-option name="href" select="concat(concat(concat(concat('tmp-hdata/result_organizers/',$organizerId), '/'), $resultId), '.xml')">
                <p:empty/>
            </p:with-option>
          </p:store>
      </p:for-each>
      
  </p:for-each>
  
  <p:xslt name="transform-person-information">
    <p:input port="source">
        <p:pipe step="cda-to-hdata" port="source"/>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="xslt/cda-to-patient.xslt"/>
    </p:input>
    <p:input port="parameters" sequence="true">
      <p:empty/>
    </p:input>
  </p:xslt>
  <p:store href="tmp-hdata/person_information/1.xml"/>
  
</p:declare-step>