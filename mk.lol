HAI 1.4

O HAI IM mk
	OBTW
		The microKanren library.
		It contains:
			* Constructors for microKanren datatypes:
				* var - Unifiable variables.
				* num - Signed integer.
				* string
				* list - Cons list.
			* A prettifier for these data types.
		
		To add:
			* Relations.
	TLDR
	
	BTW the microKanren types.
	O HAI IM types
		I HAS A var ITZ 0
		I HAS A num ITZ 1
		I HAS A string ITZ 2
		I HAS A list ITZ 3
	KTHX
	
	HOW IZ I has_type YR val AN YR type
		BOTH SAEM val AN ME'Z nil, O RLY?
			YA RLY
				FOUND YR BOTH SAEM ME'Z types'Z list AN type
			NO WAI
				FOUND YR BOTH SAEM val'Z type AN type
		OIC
	IF U SAY SO
	
	HOW IZ I type_to_string YR type
		BOTH SAEM type AN ME'Z types'Z var, O RLY?
			YA RLY
				FOUND YR "var"
			MEBBE BOTH SAEM type AN ME'Z types'Z num
				FOUND YR "num"
			MEBBE BOTH SAEM type AN ME'Z types'Z string
				FOUND YR "string"
			MEBBE BOTH SAEM type AN ME'Z types'Z list
				FOUND YR "list"
			NO WAI
				FOUND YR SMOOSH "Unknown microKanren type: " AN type AN "." MKAY
		OIC
	IF U SAY SO
	
	HOW IZ I var YR id_
		O HAI IM new_var
			I HAS A id ITZ id_
			I HAS A type ITZ ME'Z types'Z var
		KTHX
		FOUND YR new_var
	IF U SAY SO
	
	HOW IZ I is_var YR val
		FOUND YR ME IZ has_type YR val AN YR ME'Z types'Z var MKAY
	IF U SAY SO
	
	HOW IZ I num YR n_
		O HAI IM new_num
			I HAS A n ITZ n_
			I HAS A type ITZ ME'Z types'Z num
		KTHX
		FOUND YR new_num
	IF U SAY SO
	
	HOW IZ I is_num YR val
		FOUND YR ME IZ has_type YR val AN YR ME'Z types'Z num MKAY
	IF U SAY SO
	
	HOW IZ I string YR str_
		O HAI IM new_string
			I HAS A str ITZ str_
			I HAS A type ITZ ME'Z types'Z string
		KTHX
		FOUND YR new_string
	IF U SAY SO
	
	HOW IZ I is_string YR val
		FOUND YR ME IZ has_type YR val AN YR ME'Z types'Z string MKAY
	IF U SAY SO
	
	BTW A cons list.
	HOW IZ I cons YR head_ AN YR tail_
		O HAI IM new_list
			I HAS A head ITZ head_
			I HAS A tail ITZ tail_
			I HAS A type ITZ ME'Z types'Z list
		KTHX
		FOUND YR new_list
	IF U SAY SO
	
	I HAS A nil ITZ 0
	
	HOW IZ I is_list YR val
		FOUND YR ME IZ has_type YR val AN YR ME'Z types'Z list MKAY
	IF U SAY SO
	
	BTW Turn microKanren value into a string.
	HOW IZ I prettify YR val
		ME IZ is_var YR val MKAY, O RLY?
			YA RLY
				FOUND YR SMOOSH "_." AN val'Z id MKAY
			MEBBE ME IZ is_num YR val MKAY
				FOUND YR val'Z n
			MEBBE ME IZ is_string YR val MKAY
				FOUND YR SMOOSH ":"" AN val'Z str AN ":"" MKAY
			MEBBE ME IZ is_list YR val MKAY
				BOTH SAEM val AN ME'Z nil, O RLY?
					YA RLY
						FOUND YR "[]"
					NO WAI
						I HAS A prettified ITZ "["
						I HAS A current_head ITZ val'Z head
						I HAS A current_tail ITZ val'Z tail
						IM IN YR LOOP UPPIN YR i TIL BOTH SAEM current_tail AN ME'Z nil
							prettified R SMOOSH prettified AN ME IZ prettify YR current_head MKAY AN " " MKAY
							current_head R current_tail'Z head
							current_tail R current_tail'Z tail
						IM OUTTA YR LOOP
						FOUND YR SMOOSH prettified AN ME IZ prettify YR current_head MKAY AN "]" MKAY
				OIC
			NO WAI
				FOUND YR SMOOSH "Unknown microKanren type: " AN val'Z type AN "." MKAY
		OIC
	IF U SAY SO
KTHX

HOW IZ I bool_to_string YR bool
	bool, O RLY?
		YA RLY
			FOUND YR "true"
		NO WAI
			FOUND YR  "false"
	OIC
IF U SAY SO

HOW IZ I test
	I HAS A var ITZ mk IZ var YR 0 MKAY
	VISIBLE mk IZ prettify YR var MKAY
	VISIBLE mk IZ type_to_string YR var'Z type MKAY
	VISIBLE ""
	
	I HAS A num ITZ mk IZ num YR 5 MKAY
	VISIBLE mk IZ prettify YR num MKAY
	VISIBLE mk IZ type_to_string YR num'Z type MKAY
	VISIBLE ""
	
	I HAS A string ITZ mk IZ string YR "str" MKAY
	VISIBLE mk IZ prettify YR string MKAY
	VISIBLE mk IZ type_to_string YR string'Z type MKAY
	VISIBLE ""
	
	I HAS A list ITZ mk IZ cons YR mk IZ num YR 1 MKAY AN YR mk IZ cons YR mk IZ num YR 2 MKAY AN YR mk'Z nil MKAY MKAY
	VISIBLE mk IZ prettify YR list MKAY
	VISIBLE mk IZ type_to_string YR list'Z type MKAY
	VISIBLE ""
	
	I HAS A deep_list ITZ mk IZ cons YR list AN YR mk IZ cons YR list AN YR mk'Z nil MKAY MKAY
	VISIBLE mk IZ prettify YR deep_list MKAY
	VISIBLE ""
	
	VISIBLE mk IZ prettify YR mk'Z nil MKAY
	VISIBLE I IZ bool_to_string YR mk IZ is_list YR mk'Z nil MKAY MKAY
IF U SAY SO

I IZ test MKAY

KTHXBYE