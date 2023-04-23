<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:json="http://json.org/"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="json xsi">

    <xsl:output method="text"/>

    <xsl:template name="jsonTemplate" match="*">
        <xsl:text>{&#xA;"</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>":{</xsl:text>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="*">
            <xsl:with-param name="parent" select="'Yes'"/>
        </xsl:apply-templates>
        <xsl:text>&#xA;}</xsl:text>
    </xsl:template>

    <xsl:template match="*">
        <xsl:variable name="parentName" select="name(..)"/>
        <xsl:choose>
            <xsl:when test="not(*)">
                <xsl:value-of select="concat('&quot;',name(), '&quot;: aa&quot;', ., '&quot;')"/>
                <xsl:if test="$parentName">
                    <xsl:text>,</xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$parentName">
                        <xsl:value-of select="concat('&quot;',name(), '&quot;: bb[')"/>
                        <xsl:apply-templates select="*" mode="array"/>
                        <xsl:text>]</xsl:text>
                        <xsl:if test="position() != last()">
                            <xsl:text>,</xsl:text>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>{</xsl:text>
                        <xsl:value-of select="concat('&quot;',name(), '&quot; : {&#xA;&#x9;')"/>
                        <xsl:apply-templates select="@*"/>
                        <xsl:apply-templates select="*"/>
                        <xsl:text>}</xsl:text>
                        <xsl:if test="position() != last()">
                            <xsl:text>,</xsl:text>
                        </xsl:if>
                        <xsl:text>}</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="@*">
        <xsl:value-of select="concat('&quot;',name(), '&quot;: dd&quot;', ., '&quot;')"/>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="*/@xsi:noNamespaceSchemaLocation"/>

    <xsl:template match="*" mode="array">
        <!--<xsl:text>{</xsl:text>-->

        <!--<xsl:text>"value" : </xsl:text>-->
        <!--<xsl:value-of select="concat('&quot;',name(), '&quot;:')"/>-->
        <!--<xsl:text>{&#xA;"</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>"aaaaaaaaaaa: {</xsl:text>-->
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates select="*">
            <xsl:with-param name="parent" select="'Yes'"/>
        </xsl:apply-templates>
        <xsl:text>}</xsl:text>        <!--<xsl:text>}</xsl:text>-->
        <xsl:if test="position() != last()">
            <xsl:text>,&#xA;</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
