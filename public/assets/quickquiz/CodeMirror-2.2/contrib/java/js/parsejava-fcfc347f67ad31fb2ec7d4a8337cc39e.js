/**
 * Java parser for codemirror
 *
 * @author Patrick Wied
 */
var JavaParser=Editor.Parser=function(){function c(a,b,c,d,e,f){this.indented=a,this.column=b,this.type=c,d!=null&&(this.align=d),this.prev=e,this.info=f}function d(a){return function(b){var c=b&&b.charAt(0),d=a.type,e=c==d;return d=="form"&&c=="{"?a.indented:d=="stat"||d=="form"?a.indented+indentUnit:a.info=="switch"&&!e?a.indented+(/^(?:case|default)\b/.test(b)?indentUnit:2*indentUnit):a.align?a.column-(e?1:0):a.indented+(e?0:indentUnit)}}function e(b,e){function n(){while(g[g.length-1].lex)g.pop()();var a=f.next();a.type=="whitespace"&&i==0&&(j=a.value.length),i+=a.value.length,a.content=="\n"&&(j=i=0,"align"in h||(h.align=!1),a.indentation=d(h));if(a.type=="whitespace"||a.type=="comment"||a.type=="javadoc"||a.type=="annotation")return a;"align"in h||(h.align=!0);for(;;){k=l=!1,g.pop()(a.type,a.content);if(k)return l&&(a.style=l),a}}function o(){var a=h,b=g.concat([]),c=f.state;return function d(d){return h=a,g=b.concat([]),i=j=0,f=tokenizeJava(d,c),m}}function p(a){for(var b=a.length-1;b>=0;b--)g.push(a[b])}function q(){p(arguments),k=!0}function r(){p(arguments),k=!1}function s(a){l=a}function t(a,b){var d=function(){h=new c(j,i,a,null,h,b)};return d.lex=!0,d}function u(){h=h.prev}function v(a){return function b(b){b==a?q():q(arguments.callee)}}function w(a){return r(x,w)}function x(a){a=="keyword a"?q(t("form"),y,x,u):a=="keyword b"?q(t("form"),x,u):a=="{"?q(t("}"),C,u):a=="for"?q(t("form"),v("("),t(")"),D,v(")"),u,x,u):a=="variable"?q(t("stat"),A):a=="switch"?q(t("form"),y,t("}","switch"),v("{"),C,u,u):a=="case"?q(y,v(":")):a=="default"?q(v(":")):a=="catch"?q(t("form"),v("("),function(){},v(")"),x,u):a=="class"?q():a=="interface"?q():a=="keyword c"?q(x):r(t("stat"),y,v(";"),u)}function y(b){a.hasOwnProperty(b)?q(z):b=="keyword c"?q(y):b=="("?q(t(")"),y,v(")"),u,z):b=="operator"?q(y):b=="["&&q(t("]"),B(y,"]"),u,z)}function z(a){a=="operator"?q(y):a=="("?q(t(")"),y,B(y,")"),u,z):a=="["&&q(t("]"),y,v("]"),u,z)}function A(a){a=="("?q(B(function(){},")"),u,x):a=="{"?q(u,t("}"),C,u):r(z,v(";"),u)}function B(a,b){function c(d){d==","?q(a,c):d==b?q():q(v(b))}return function d(d){d==b?q():r(a,c)}}function C(a){a=="}"?q():r(x,C)}function D(a){a==";"?r(F):r(F)}function E(a,b){b=="in"?q(y):q(z,F)}function F(a,b){a==";"?q(G):b=="in"?q(y):q(y,v(";"),G)}function G(a){a==")"?r():q(y)}var f=tokenizeJava(b),g=[w],h=new c(e||0,0,"block",!1),i=0,j=0,k,l,m={next:n,copy:o};return u.lex=!0,m}var a={atom:!0,number:!0,string:!0,regexp:!0},b=!1;return{make:e,electricChars:"{}:",configure:function(a){a.json!=null&&(b=a.json)}}}()