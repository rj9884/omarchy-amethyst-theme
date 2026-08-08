<?xml version="1.0" encoding="UTF-8"?>
<style-scheme id="builder-dark" _name="Builder Dark" version="1.0">
  <author>Omarchy</author>
  <_description>Omarchy Dynamic Color Scheme for GNOME Text Editor &amp; Sushi</_description>

  <color name="bg"                          value="{{ background }}"/>
  <color name="fg"                          value="{{ foreground }}"/>
  <color name="card"                        value="{{ color0 }}"/>
  <color name="accent"                      value="{{ accent }}"/>
  <color name="border"                      value="{{ color8 }}"/>
  <color name="red"                         value="{{ color1 }}"/>
  <color name="green"                       value="{{ color2 }}"/>
  <color name="yellow"                      value="{{ color3 }}"/>
  <color name="blue"                        value="{{ color4 }}"/>
  <color name="magenta"                     value="{{ color5 }}"/>

  <!-- Global Settings -->
  <style name="text"                        foreground="fg" background="bg"/>
  <style name="selection"                   foreground="bg" background="accent"/>
  <style name="cursor"                      foreground="accent"/>
  <style name="current-line"                background="card"/>
  <style name="current-line-number"         background="card"/>
  <style name="line-numbers"                foreground="border" background="bg"/>
  <style name="draw-spaces"                 foreground="border"/>
  <style name="background-pattern"          background="bg"/>

  <!-- Syntax Highlighting -->
  <style name="def:comment"                 foreground="border" italic="true"/>
  <style name="def:string"                  foreground="green"/>
  <style name="def:keyword"                 foreground="magenta" bold="true"/>
  <style name="def:type"                    foreground="yellow"/>
  <style name="def:function"                foreground="blue"/>
  <style name="def:number"                  foreground="red"/>
  <style name="def:constant"                foreground="red"/>
  <style name="def:identifier"              foreground="fg"/>
  <style name="def:statement"               foreground="magenta"/>
  <style name="def:operator"                foreground="accent"/>
</style-scheme>
