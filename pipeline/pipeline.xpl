<?xml version="1.0"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cda="urn:hl7-org:v3" xmlns:hdata="http://projecthdata.org/hdata">
  <p:input port="source"/>
  <p:output port="result"/>
  <p:import href="patient-to-cda.xpl"/>
  
  <hdata:patient-to-cda>
      <p:with-option name="sourceFolder" select="'../hdata-examples/simple/patient_information/'"/>
  </hdata:patient-to-cda>

  <p:filter select="//cda:patientRole" name="filter-patient"/>
  <p:insert position="last-child" match="/cda:ClinicalDocument/cda:recordTarget">
      <p:input port="insertion">
          <p:pipe step="filter-patient" port="result"/>
      </p:input>
      <p:input port="source">
          <p:document href="StubCDA.xml"/>
      </p:input>
  </p:insert>
</p:declare-step>