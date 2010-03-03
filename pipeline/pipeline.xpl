<?xml version="1.0"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step">
  <p:input port="source"/>
  <p:output port="result"/>
  
  <p:variable name="sourceFolder" select="'../../lab-cp/hdata-examples/simple/patient_information/'"/>
  <p:directory-list name="find-patient-information">
    <p:with-option name="path" select="$sourceFolder">
        <p:empty/>
    </p:with-option>
  </p:directory-list>
  <p:for-each>
      <p:iteration-source select="//c:file"/>
      <p:variable name="fileName" select="c:file/@name"/>
      <p:load>
          <p:with-option name="href" select="concat($sourceFolder,$fileName)">
              <p:empty/>
          </p:with-option>
      </p:load>
      <p:xslt>
        <p:input port="stylesheet">
          <p:document href="xslt/patient-to-cda.xslt"/>
        </p:input>
        <p:input port="parameters" sequence="true">
          <p:empty/>
        </p:input>
      </p:xslt>
  </p:for-each>
  <p:wrap-sequence wrapper="ClinicalDocument"/>
</p:declare-step>