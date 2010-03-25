<?xml version="1.0"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cda="urn:hl7-org:v3" xmlns:hdata="http://projecthdata.org/hdata" name="hdata-to-cda">
  <p:input port="source"/>
  <p:output port="result">
      <p:pipe step="transform-person-information" port="result"/>
  </p:output>
  
  <p:xslt name="transform-person-information">
    <p:input port="stylesheet">
      <p:document href="xslt/cda-to-patient.xslt"/>
    </p:input>
    <p:input port="parameters" sequence="true">
      <p:empty/>
    </p:input>
    <p:input port="source">
        <p:document href="../cda-examples/simple-example.xml"/>
    </p:input>
  </p:xslt>
  
  <p:store href="tmp-hdata/person_information/1.xml"/>
</p:declare-step>