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
			* Some state functions.
				* find - Deref a var once.
				* walk - Deref a var until base value is found.
				* walk_all - walk but for lists too.
				* unify - Assert that two values the same.
		
		To add:
			* Relations.
	TLDR
	
	BTW the microKanren types.
	O HAI IM types
		BTW Core types.
		I HAS A var ITZ 0
		I HAS A num ITZ 1
		I HAS A string ITZ 2
		I HAS A list ITZ 3
		
		BTW Types that need to be checked.
		I HAS A bool ITZ 4
		I HAS A state ITZ 5
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
	
	HOW IZ I length YR list
		I HAS A current_tail ITZ list
		IM IN YR LOOP UPPIN YR i
			BOTH SAEM current_tail AN ME'Z nil, O RLY?, YA RLY
				FOUND YR i
			OIC
			current_tail R current_tail'Z tail
		IM OUTTA YR LOOP
	IF U SAY SO
	
	O HAI IM true
		I HAS A bl ITZ WIN
		I HAS A type ITZ ME'Z types'Z bool
	KTHX
	
	O HAI IM false
		I HAS A bl ITZ FAIL
		I HAS A type ITZ ME'Z types'Z bool
	KTHX
	
	HOW IZ I is_bool YR val
		FOUND YR ME IZ has_type YR val AN YR ME'Z types'Z bool MKAY
	IF U SAY SO
	
	HOW IZ I is_false YR val
		ME IZ is_bool YR val MKAY, O RLY?, YA RLY
			FOUND YR I IZ not YR val'Z bl MKAY
		NO WAI
			FOUND YR FAIL
		OIC
	IF U SAY SO
	
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
			OIC
			I HAS A prettified ITZ "("
			I HAS A current_head ITZ val'Z head
			I HAS A current_tail ITZ val'Z tail
			IM IN YR LOOP UPPIN YR i TIL BOTH SAEM current_tail AN ME'Z nil
				prettified R SMOOSH prettified AN ME IZ prettify YR current_head MKAY AN " " MKAY
				current_head R current_tail'Z head
				current_tail R current_tail'Z tail
			IM OUTTA YR LOOP
			FOUND YR SMOOSH prettified AN ME IZ prettify YR current_head MKAY AN ")" MKAY
		MEBBE ME IZ is_bool YR val MKAY
			FOUND YR I IZ bool_to_string YR val'Z bl MKAY
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
		IM IN YR LOOP
			I IZ not YR ME IZ is_var YR val MKAY MKAY, O RLY?, YA RLY
				FOUND YR val
			OIC
			I HAS A next_val ITZ ME IZ find YR val AN YR state MKAY
			ME IZ is_var YR next_val MKAY, O RLY?, YA RLY
				val R next_val
			MEBBE ME IZ is_false YR next_val MKAY
				FOUND YR val
			NO WAI
				FOUND YR next_val
			OIC
		IM OUTTA YR LOOP
	IF U SAY SO
	
	HOW IZ I walk_all YR val AN YR state
		I HAS A found ITZ ME IZ walk YR val AN YR state MKAY
		ME IZ is_list YR found MKAY, O RLY?, YA RLY
			BOTH SAEM found AN ME'Z nil, O RLY?, YA RLY
				FOUND YR ME'Z nil
			OIC
			
			O HAI IM walked_list
				I HAS A length ITZ 0
			KTHX
			I HAS A current_head ITZ val'Z head
			I HAS A current_tail ITZ val'Z tail
			
			IM IN YR LOOP UPPIN YR i TIL BOTH SAEM current_tail AN ME'Z nil
				walked_list'Z length R SUM OF i AN 1
				walked_list HAS A SRS i ITZ ME IZ walk_all YR current_head AN YR state MKAY
				current_head R current_tail'Z head
				current_tail R current_tail'Z tail
			IM OUTTA YR LOOP
			walked_list HAS A SRS walked_list'Z length ITZ ME IZ walk_all YR current_head AN YR state MKAY
			walked_list'Z length R SUM OF walked_list'Z length AN 1
			FOUND YR ME IZ list YR walked_list MKAY
		NO WAI
			FOUND YR found
		OIC
	IF U SAY SO
	
	HOW IZ I same YR x AN YR y
		BOTH OF BOTH SAEM x'Z type AN ME'Z types'Z num AN BOTH SAEM y'Z type AN ME'Z types'Z num, O RLY?, YA RLY
			FOUND YR BOTH SAEM x'Z n AN y'Z n
		MEBBE BOTH OF BOTH SAEM x'Z type AN ME'Z types'Z string AN BOTH SAEM y'Z type AN ME'Z types'Z string
			FOUND YR BOTH SAEM x'Z str AN y'Z str
		NO WAI
			FOUND YR FAIL
		OIC
	IF U SAY SO
	
	HOW IZ I unify YR x_ AN YR y_ AN YR state
		I HAS A x ITZ ME IZ walk YR x_ AN YR state MKAY
		I HAS A y ITZ ME IZ walk YR y_ AN YR state MKAY
		
		ME IZ same YR x AN YR y MKAY, O RLY?, YA RLY
			FOUND YR state
		MEBBE ME IZ is_var YR x MKAY
			O HAI IM new_pair
				I HAS A key ITZ x'Z id
				I HAS A val ITZ y
			KTHX
			state HAS A SRS state'Z length ITZ new_pair
			state'Z length R SUM OF state'Z length AN 1
			FOUND YR state
		MEBBE ME IZ is_var YR y MKAY
			O HAI IM new_pair
				I HAS A key ITZ y'Z id
				I HAS A val ITZ x
			KTHX
			state HAS A SRS state'Z length ITZ new_pair
			state'Z length R SUM OF state'Z length AN 1
			FOUND YR state
		MEBBE BOTH OF ME IZ is_list YR x MKAY AN ME IZ is_list YR y MKAY
			BOTH SAEM ME IZ length YR x MKAY AN ME IZ length YR y MKAY, O RLY?, YA RLY
				BOTH SAEM x AN ME'Z nil, O RLY?, YA RLY
					FOUND YR state
				OIC
				
				I HAS A x_head ITZ x'Z head
				I HAS A x_tail ITZ x'Z tail
				I HAS A y_head ITZ y'Z head
				I HAS A y_tail ITZ y'Z tail
				IM IN YR LOOP UPPIN YR i TIL BOTH SAEM x_tail AN ME'Z nil
					I HAS A unified ITZ ME IZ unify YR x_head AN YR y_head AN YR state MKAY
					ME IZ is_false YR unified MKAY, O RLY?, YA RLY
						FOUND YR ME'Z false
					OIC
					x_head R x_tail'Z head
					x_tail R x_tail'Z tail
					y_head R y_tail'Z head
					y_tail R y_tail'Z tail
				IM OUTTA YR LOOP
				I HAS A unified ITZ ME IZ unify YR x_head AN YR y_head AN YR state MKAY
				ME IZ is_false YR unified MKAY, O RLY?, YA RLY
					FOUND YR ME'Z false
				OIC
				FOUND YR state
			NO WAI
				FOUND YR ME'Z false
			OIC
		NO WAI
			FOUND YR ME'Z false
		OIC
	IF U SAY SO
	
	HOW IZ I eq YR x_ AN YR y_
		O HAI IM eq_with_state
			I HAS A x_ ITZ x
			I HAS A y_ ITZ y
			HOW IZ I call YR self AN YR state
				FOUND YR ME IZ unify YR self'Z x AN YR self'Z y AN YR state MKAY
			IF U SAY SO
		KTHX
		FOUND YR eq_with_state
	IF U SAY SO
	
	HOW IZ I conde YR programs_
		O HAI IM conde_with_state
			I HAS A programs ITZ programs_
			HOW IZ I call YR self AN YR state
				BTW Add disjunction for each program in programs.
			IF U SAY SO
		KTHX
		FOUND YR conde_with_state
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
	VISIBLE mk IZ length YR consed MKAY
	VISIBLE ""

	I HAS A same_n ITZ mk IZ num YR 0 MKAY
	I HAS A other_n ITZ mk IZ num YR 2 MKAY
	I HAS A same_s ITZ mk IZ string YR "a" MKAY
	VISIBLE SMOOSH "0 = 0:: " AN I IZ bool_to_string YR mk IZ same YR same_n AN YR same_n MKAY MKAY MKAY
	VISIBLE SMOOSH "0 = 2:: " AN I IZ bool_to_string YR mk IZ same YR same_n AN YR other_n MKAY MKAY MKAY
	VISIBLE SMOOSH ":"a:" = 0:: " AN I IZ bool_to_string YR  mk IZ same YR same_s AN YR same_n MKAY MKAY MKAY
	VISIBLE SMOOSH ":"a:" = :"a:":: " AN I IZ bool_to_string YR  mk IZ same YR same_s AN YR same_s MKAY MKAY MKAY
	
	VISIBLE "--------------------:)"
IF U SAY SO

HOW IZ I state_test
	VISIBLE "state_test:)--------------------"
	
	mk'Z next_id R 0
	
	I HAS A x ITZ mk IZ var MKAY
	I HAS A y ITZ mk IZ var MKAY
	I HAS A z ITZ mk IZ var MKAY
	I HAS A w ITZ mk IZ var MKAY
	O HAI IM find_test
		I HAS A type ITZ mk'Z types'Z state
		I HAS A length ITZ 3
		
		O HAI IM SRS 0
			I HAS A key ITZ 1
			I HAS A val ITZ mk IZ num YR 5 MKAY
		KTHX
		O HAI IM SRS 1
			I HAS A key ITZ 0
			I HAS A val ITZ mk IZ num YR 6 MKAY
		KTHX
		O HAI IM SRS 2
			I HAS A key ITZ 2
			I HAS A val ITZ x
		KTHX
	KTHX
	VISIBLE SMOOSH "find x: " AN mk IZ prettify YR mk IZ find YR x AN YR find_test MKAY MKAY MKAY
	VISIBLE SMOOSH "find y: " AN mk IZ prettify YR mk IZ find YR y AN YR find_test MKAY MKAY MKAY
	VISIBLE SMOOSH "find z: " AN mk IZ prettify YR mk IZ find YR z AN YR find_test MKAY MKAY MKAY
	VISIBLE SMOOSH "find w: " AN mk IZ prettify YR mk IZ find YR w AN YR find_test MKAY MKAY MKAY
	VISIBLE ""
	VISIBLE SMOOSH "walk x: " AN mk IZ prettify YR mk IZ walk YR x AN YR find_test MKAY MKAY MKAY
	VISIBLE SMOOSH "walk y: " AN mk IZ prettify YR mk IZ walk YR y AN YR find_test MKAY MKAY MKAY
	VISIBLE SMOOSH "walk z: " AN mk IZ prettify YR mk IZ walk YR z AN YR find_test MKAY MKAY MKAY
	VISIBLE SMOOSH "walk w: " AN mk IZ prettify YR mk IZ walk YR w AN YR find_test MKAY MKAY MKAY
	VISIBLE ""
	
	O HAI IM nested_test
		I HAS A SRS 0 ITZ y
		I HAS A SRS 1 ITZ z
		
		I HAS A length ITZ 2
	KTHX
	O HAI IM walk_all_test_list
		I HAS A SRS 0 ITZ x
		I HAS A SRS 1 ITZ mk IZ list YR nested_test MKAY
		
		I HAS A length ITZ 2
	KTHX
	I HAS A walk_all_test ITZ mk IZ list YR walk_all_test_list MKAY
	VISIBLE SMOOSH "list of pointers: " AN mk IZ prettify YR walk_all_test MKAY MKAY
	VISIBLE SMOOSH "walk_all: " AN mk IZ prettify YR mk IZ walk_all YR walk_all_test AN YR find_test MKAY MKAY MKAY
	
	I HAS A v_3 ITZ mk IZ num YR 3 MKAY
	I HAS A v_4 ITZ mk IZ num YR 4 MKAY
	
	I HAS A unify_3 ITZ mk IZ unify YR v_3 AN YR v_3 AN YR find_test MKAY
	mk IZ is_false YR unify_3 MKAY, O RLY?, YA RLY
		VISIBLE "(== 3 3):: false"
	NO WAI
		VISIBLE "(== 3 3):: true"
	OIC
	
	I HAS A unify_3_4 ITZ mk IZ unify YR v_3 AN YR v_4 AN YR find_test MKAY
	mk IZ is_false YR unify_3_4 MKAY, O RLY?, YA RLY
		VISIBLE "(== 3 4):: false"
	NO WAI
		VISIBLE "(== 3 4):: true"
	OIC
	
	I HAS A unify_w_3 ITZ mk IZ unify YR w AN YR v_3 AN YR find_test MKAY
	mk IZ is_false YR unify_w_3 MKAY, O RLY?, YA RLY
		VISIBLE "(== w 3):: false"
	NO WAI
		VISIBLE "(== w 3):: true"
	OIC
	
	I HAS A unify_w_4 ITZ mk IZ unify YR w AN YR v_4 AN YR find_test MKAY
	mk IZ is_false YR unify_w_4 MKAY, O RLY?, YA RLY
		VISIBLE "(== w 4):: false"
	NO WAI
		VISIBLE "(== w 4):: true"
	OIC
	
	I HAS A v ITZ mk IZ var MKAY
	I HAS A u ITZ mk IZ var MKAY
	I HAS A list_1 ITZ mk IZ cons YR u AN YR mk IZ cons YR v_4 AN YR mk'Z nil MKAY MKAY
	I HAS A list_2 ITZ mk IZ cons YR v_3 AN YR mk IZ cons YR v AN YR mk'Z nil MKAY MKAY
	
	I HAS A unify_lists ITZ mk IZ unify YR list_1 AN YR list_2 AN YR find_test MKAY
	mk IZ is_false YR unify_lists MKAY, O RLY?, YA RLY
		VISIBLE "(==:)  (u 4):)  (3 v)):: false"
	NO WAI
		VISIBLE "(==:)  (u 4):)  (3 v)):: true"
	OIC
	
	I HAS A unify_u_3 ITZ mk IZ unify YR u AN YR v_3 AN YR find_test MKAY
	mk IZ is_false YR unify_u_3 MKAY, O RLY?, YA RLY
		VISIBLE "(== u 3):: false"
	NO WAI
		VISIBLE "(== u 3):: true"
	OIC
	
	VISIBLE "--------------------:)"
IF U SAY SO

I IZ type_test MKAY
I IZ state_test MKAY

KTHXBYE