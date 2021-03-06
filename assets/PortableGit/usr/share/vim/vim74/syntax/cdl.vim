" Vim syntax file
" Language: Comshare Dimension Definition Language
" Maintainer:	Raul Segura Acevedo <raulseguraaceved@netscape.net>
" Last change:	2001 Jul 31

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

sy case ignore
sy sync fromstart
sy keyword	cdlStatement	dimension hierarchy group grouphierarchy schedule class
sy keyword	cdlType		add update file category main altername removeall required notrequired
sy keyword	cdlConditional	if then elseif else endif and or not cons rpt xlt
sy keyword	cdlFunction	ChildOf IChildOf LeafChildOf DescendantOf IDescendantOf LeafDescendantOf MemberIs CountOf

sy keyword	cdlIdentifier	contained id name desc description xlttype precision symbol curr_ name group_name rate_name
sy keyword	cdlIdentifier	contained xcheck endbal accounttype natsign consolidate formula pctown usage periodicity
sy match	cdlIdentifier	contained 'child\s*name'
sy match	cdlIdentifier	contained 'parent\s*name'
sy match	cdlIdentifier	contained 'grp\s*description'
sy match	cdlIdentifier	contained 'grpchild\s*name'
sy match	cdlIdentifier	contained 'grpparent\s*name'
sy match	cdlIdentifier	contained 'preceding\s*member'
sy match	cdlIdentifier	contained 'unit\s*name'
sy match	cdlIdentifier	contained 'unit\s*id'
sy match	cdlIdentifier	contained 'schedule\s*name'
sy match	cdlIdentifier	contained 'schedule\s*id'

sy match	cdlString	/\[[^]]*]/	contains=cdlRestricted,cdlNotSupported
sy match	cdlRestricted	contained /[&*,_]/
" not supported  , [, ]
sy match	cdlNotSupported	contained /[:"!']/

sy keyword	cdlTodo		contained TODO FIXME XXX
sy cluster	cdlCommentGroup contains=cdlTodo
sy match	cdlComment	'//.*' contains=@cdlCommentGroup
sy region	cdlComment	start="/\*" end="\*/" contains=@cdlCommentGroup fold
sy match	cdlCommentE	"\*/"

sy region	cdlParen	transparent start='(' end=')' contains=ALLBUT,cdlParenE,cdlRestricted,cdlNotSupported
"sy region	cdlParen	transparent start='(' end=')' contains=cdlIdentifier,cdlComment,cdlParenWordE
sy match	cdlParenE	")"
"sy match	cdlParenWordE	contained "\k\+"

sy keyword	cdlFxType	allocation downfoot expr xltgain
"sy keyword	cdlFxType	contained allocation downfoot expr xltgain
"sy region	cdlFx		transparent start='\k\+(' end=')' contains=cdlConditional,cdlFunction,cdlString,cdlComment,cdlFxType

set foldmethod=expr
set foldexpr=(getline(v:lnum+1)=~'{'\|\|getline(v:lnum)=~'//\\s\\*\\{5}.*table')?'>1':1
%foldo!
set foldmethod=manual
let b:match_words='\<if\>:\<then\>:\<elseif\>:\<else\>:\<endif\>'

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_csc_syntax_inits")
	if version < 508
		let did_csc_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink cdlStatement	Statement
	HiLink cdlType		Type
	HiLink cdlFxType	Type
	HiLink cdlIdentifier	Identifier
	HiLink cdlString	String
	HiLink cdlRestricted	WarningMsg
	HiLink cdlNotSupported	ErrorMsg
	HiLink cdlTodo		Todo
	HiLink cdlComment	Comment
	HiLink cdlCommentE	ErrorMsg
	HiLink cdlParenE	ErrorMsg
	HiLink cdlParenWordE	ErrorMsg
	HiLink cdlFunction	Function
	HiLink cdlConditional	Conditional

	delcommand HiLink
endif

let b:current_syntax = "cdl"

" vim: ts=8
