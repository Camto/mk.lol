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
		I HAS A bool ITZ 4
	KTHX
	
	HOW IZ I has_type YR val AN YR type
		BOTH SAEM val AN ME'Z nil, O RLY?, YA RLY
			FOUND YR BOTH SAEM ME'Z types'Z list AN type
		NO WAI
			FOUND YR BOTH SAEM val'Z type AN type
		OIC
	IF U SAY SO
	
	HOW IZ I type_to_string YR type
		BOTH SAEM type AN ME'Z types'Z var, O RLY?, YA RLY
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
	
	I HAS A next_id ITZ 0
	
	HOW IZ I var
		O HAI IM new_var
			I HAS A id ITZ ME'Z next_id
			I HAS A type ITZ ME'Z types'Z var
		KTHX
		ME'Z next_id R SUM OF ME'Z next_id AN 1
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
	
	I HAS A nil ITZ 0
	
	BTW Turn a normal list into a cons list.
	HOW IZ I list YR list_
		I HAS A current_list ITZ ME'Z nil
		I HAS A next_list ITZ ME'Z nil
		
		IM IN YR LOOP UPPIN YR i TIL BOTH SAEM i AN list_'Z length
			I HAS A idx ITZ DIFF OF DIFF OF list_'Z length AN i AN 1
			next_list R ME IZ cons YR list_'Z SRS idx AN YR current_list MKAY
			current_list R next_list
		IM OUTTA YR LOOP
		
		FOUND YR next_list
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
	
	HOW IZ I is_list YR val
		FOUND YR ME IZ has_type YR val AN YR ME'Z types'Z list MKAY
	IF U SAY SO
	
	O HAI IM true
		I HAS A bl ITZ WIN
		I HAS A type ITZ ME'Z types'Z bool
	KTHX
	
	O HAI IM false
		I HAS A bl ITZ FAIL
		I HAS A type ITZ ME'Z types'Z bool
	KTHX
	
	BTW Turn microKanren value into a string.
	HOW IZ I prettify YR val
		ME IZ is_var YR val MKAY, O RLY?, YA RLY
			FOUND YR SMOOSH "_." AN val'Z id MKAY
		MEBBE ME IZ is_num YR val MKAY
			FOUND YR val'Z n
		MEBBE ME IZ is_string YR val MKAY
			FOUND YR SMOOSH ":"" AN val'Z str AN ":"" MKAY
		MEBBE ME IZ is_list YR val MKAY
			BOTH SAEM val AN ME'Z nil, O RLY?,YA RLY
				FOUND YR "()"
			NO WAI
				I HAS A prettified ITZ "("
				I HAS A current_head ITZ val'Z head
				I HAS A current_tail ITZ val'Z tail
				IM IN YR LOOP UPPIN YR i TIL BOTH SAEM current_tail AN ME'Z nil
					prettified R SMOOSH prettified AN ME IZ prettify YR current_head MKAY AN " " MKAY
					current_head R current_tail'Z head
					current_tail R current_tail'Z tail
				IM OUTTA YR LOOP
				FOUND YR SMOOSH prettified AN ME IZ prettify YR current_head MKAY AN ")" MKAY
			OIC
		NO WAI
			FOUND YR SMOOSH "Unknown microKanren type: " AN val'Z type AN "." MKAY
		OIC
	IF U SAY SO
	
	HOW IZ I find YR var AN YR state
		IM IN YR LOOP UPPIN YR i TIL BOTH SAEM i AN state'Z length
			I HAS A item ITZ state'Z SRS i
			BOTH SAEM var'Z id AN item'Z key, O RLY?, YA RLY
				FOUND YR item'Z val
			OIC
		IM OUTTA YR LOOP
		FOUND YR ME'Z false
	IF U SAY SO
	
	BTW Find value of variable in state.
	HOW IZ I walk YR val AN YR state
		ME IZ is_var YR val MKAY, O RLY?, YA RLY
			BTW Find var in state.
		NO WAI
			FOUND YR val
		OIC
	IF U SAY SO
KTHX

HOW IZ I not YR bool
	bool, O RLY?, YA RLY
		FOUND YR FAIL
	 NO WAI
		FOUND YR WIN
	OIC
IF U SAY SO

HOW IZ I bool_to_string YR bool
	bool, O RLY?, YA RLY
		FOUND YR "true"
	NO WAI
		FOUND YR  "false"
	OIC
IF U SAY SO

HOW IZ I type_test
	VISIBLE "type_test:)--------------------"
	
	I HAS A var ITZ mk IZ var MKAY
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
	VISIBLE ""
	
	O HAI IM normal_list
		I HAS A length ITZ 3
		
		I HAS A SRS 0 ITZ mk IZ num YR 45 MKAY
		I HAS A SRS 1 ITZ mk IZ num YR 98 MKAY
		I HAS A SRS 2 ITZ mk IZ num YR 47 MKAY
	KTHX
	I HAS A consed ITZ mk IZ list YR normal_list MKAY
	VISIBLE mk IZ prettify YR consed MKAY
	
	VISIBLE "--------------------:)"
IF U SAY SO

HOW IZ I state_test
	VISIBLE "state_test:)--------------------"
	
	mk'Z next_id R 0
	
	I HAS A x ITZ mk IZ var MKAY
	I HAS A y ITZ mk IZ var MKAY
	O HAI IM find_test
		O HAI IM SRS 0
			I HAS A key ITZ 1
			I HAS A val ITZ 5
		KTHX
		O HAI IM SRS 1
			I HAS A key ITZ 0
			I HAS A val ITZ 6
		KTHX
		
		I HAS A length ITZ 2
	KTHX
	VISIBLE mk IZ find YR x AN YR find_test MKAY
	VISIBLE mk IZ find YR y AN YR find_test MKAY
	
	VISIBLE "--------------------:)"
IF U SAY SO

I IZ type_test MKAY
I IZ state_test MKAY

KTHXBYE