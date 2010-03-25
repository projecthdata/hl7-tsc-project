<?xml version="1.0"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cda="urn:hl7-org:v3" xmlns:hdata="http://projecthdata.org/hdata" name="hdata-to-cda">
  <p:input port="source"/>
  <p:output port="result"/>
  <p:import href="patient-to-cda.xpl"/>
  <p:import href="result-organizer-to-cda.xpl"/>
  
  <hdata:patient-to-cda name="patient-to-cda">
      <p:input port="source">
          <p:pipe step="hdata-to-cda" port="source"/>
      </p:input>
      <p:with-option name="sourceFolder" select="'../hdata-examples/simple/patient_information/'"/>
  </hdata:patient-to-cda>

  <hdata:result-organizer-to-cda name="result-organizer-to-cda">
      <p:input port="source">
          <p:pipe step="hdata-to-cda" port="source"/>
      </p:input>
      <p:with-option name="sourceFolder" select="'../hdata-examples/simple/result_organizers/'"/>
  </hdata:result-organizer-to-cda>

  <p:insert position="last-child" match="/cda:ClinicalDocument/cda:recordTarget">
      <p:input port="insertion">
          <p:pipe step="patient-to-cda" port="result"/>
      </p:input>
      <p:input port="source">
          <p:document href="StubCDA.xml"/>
      </p:input>
  </p:insert>
  
  <p:insert position="last-child" match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry">
      <p:input port="insertion">
          <p:pipe step="result-organizer-to-cda" port="result"/>
      </p:input>
  </p:insert>
</p:declare-step>