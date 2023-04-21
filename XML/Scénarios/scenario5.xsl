<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:json="http://json.org/" exclude-result-prefixes="json">

    <xsl:output method="text"/>

    <xsl:template match="*">
        "<xsl:value-of select="name()"/>" :<xsl:call-template name="jsonTemplate">
    </xsl:call-template>
    </xsl:template>

    <xsl:template name="jsonTemplate" match="*">
        <xsl:text>{&#xA;"</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>":</xsl:text>
        <xsl:apply-templates select="*">
            <xsl:with-param name="parent" select="'Yes'"> </xsl:with-param>
        </xsl:apply-templates>
        <xsl:text>&#xA;}</xsl:text>
    </xsl:template>
</xsl:stylesheet>