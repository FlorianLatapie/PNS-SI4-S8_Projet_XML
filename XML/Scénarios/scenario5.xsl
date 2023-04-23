<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:json="http://json.org/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="json xsi">

    <xsl:output method="text"/>

    <xsl:template match="/">
        <!-- Start the JSON array -->
        <xsl:text>[&#xa;</xsl:text>
        <xsl:apply-templates select="//client"/>
        <xsl:text>&#xa;]</xsl:text>
    </xsl:template>

    <xsl:template match="client">
        <xsl:variable name="id" select="@id"/>
        <xsl:variable name="nom" select="@nom"/>
        <xsl:variable name="prenom" select="@prenom"/>
        <xsl:variable name="type" select="@type"/>

        <!-- Start the JSON object for this client -->
        <xsl:text>{&#xa;</xsl:text>
        <xsl:text>"id": "</xsl:text><xsl:value-of select="$id"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"nom": "</xsl:text><xsl:value-of select="$nom"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"prenom": "</xsl:text><xsl:value-of select="$prenom"/><xsl:text>",&#xa;</xsl:text>
        <xsl:text>"type": "</xsl:text><xsl:value-of select="$type"/><xsl:text>"&#xa;</xsl:text>

        <!-- End the JSON object for this client -->
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
