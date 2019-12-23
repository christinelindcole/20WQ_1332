<?xml version='1.0'?>

<!--********************************************************************
Copyright 2018 Robert A. Beezer

This file is part of PreTeXt.

PreTeXt is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 or version 3 of the
License (at your option).

PreTeXt is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with PreTeXt.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************-->

<!-- This file is customized to read in a header file when compiling latex.
Put this file in the folder: [path to mathbook]/user/
-->

<!-- Conveniences for classes of similar elements -->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "../xsl/entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
>

<!-- Override specific tenplates of the standard conversion -->
<xsl:import href="../xsl/mathbook-latex.xsl" />

<!-- Intend output for rendering by pdflatex -->
<xsl:output method="text" />

<!-- Here is my style stuff! -->
<!--
<xsl:param name="latex.preamble.late">
    <xsl:text>% Proof environment with heading in small caps&#xa;</xsl:text>
    <xsl:text>\expandafter\let\expandafter\oldp\csname\string\proof\endcsname&#xa;</xsl:text>
    <xsl:text>\let\oldep\endproof&#xa;</xsl:text>
    <xsl:text>\renewenvironment{proof}[1][\proofname]{\oldp[\scshape #1]}{\oldep}&#xa;</xsl:text>
</xsl:param>
-->
<xsl:param name="latex.preamble.early">
  <xsl:text>\usepackage[margin=1in,paperwidth=8.5in,paperheight=11in,voffset=0in]{geometry}&#xa;</xsl:text>
</xsl:param>

<xsl:param name="latex.preamble.late">
  <xsl:text>% Include my header file&#xa;</xsl:text>
  <xsl:text>\input{1331_header}&#xa;</xsl:text>
  <xsl:text>\renewcommand{\maketitle}{\lectTitle{\myTitle}{\vspace*{.1in}\mySubTitle\vspace*{-.2in}}}&#xa;</xsl:text>
</xsl:param>


<!-- WORKSHEET STUFF -->

<!-- Includes an "event" for presentations -->
<xsl:template name="title-page-info-article">
    <xsl:text>%% Title page information for article&#xa;</xsl:text>
    <xsl:text>\renewcommand{\myTitle}{</xsl:text>
    <xsl:apply-templates select="." mode="subtitle" />
    <xsl:text>}&#xa;</xsl:text>
    <xsl:text>\renewcommand{\mySubTitle}{</xsl:text>
    <xsl:apply-templates select="." mode="title-full" />
    <xsl:text>}&#xa;</xsl:text>
    <xsl:text>\title{</xsl:text>
    <xsl:apply-templates select="." mode="title-full" />
    <xsl:if test="subtitle">
        <xsl:text>\\&#xa;</xsl:text>
        <!-- Trying to match author fontsize -->
        <xsl:text>{\large </xsl:text>
        <xsl:apply-templates select="." mode="subtitle" />
        <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:if test="$docinfo/event">
        <xsl:if test="title">
            <xsl:text>\\</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="$docinfo/event" />
    </xsl:if>
    <xsl:text>}&#xa;</xsl:text>
    <xsl:if test="frontmatter/titlepage/author or frontmatter/titlepage/editor">
        <xsl:text>\author{</xsl:text>
        <xsl:apply-templates select="frontmatter/titlepage/author" mode="article-info"/>
        <xsl:apply-templates select="frontmatter/titlepage/editor" mode="article-info"/>
        <xsl:text>}&#xa;</xsl:text>
    </xsl:if>
    <xsl:text>\date{</xsl:text><xsl:apply-templates select="frontmatter/titlepage/date" /><xsl:text>}&#xa;</xsl:text>
</xsl:template>


<xsl:template match="worksheet" mode="new-geometry">
    <!-- <xsl:text>\renewcommand{\mySubTitle}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="title-full" />
    <xsl:text>}</xsl:text>
    <xsl:text>%&#xa;</xsl:text>
    <xsl:apply-templates/> -->
</xsl:template>


</xsl:stylesheet>
