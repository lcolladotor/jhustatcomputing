
string1 <- "This is a string"
string2 <- 'If I want to include a "quote" inside a string, I use single quotes'



c("one", "two", "three")



regular_expression <- "a"
string_to_search <- "Maryland"

grepl(pattern = regular_expression, x = string_to_search)



regular_expression <- "u"
string_to_search <- "Maryland"

grepl(pattern = regular_expression, x = string_to_search)



grepl("land", "Maryland")
grepl("ryla", "Maryland")
grepl("Marly", "Maryland")
grepl("dany", "Maryland")



head(state.name)
length(state.name)



grepl(".", "Maryland")
grepl(".", "*&2[0+,%<@#~|}")
grepl(".", "")



grepl("a.b", c("aaa", "aab", "abb", "acadb"))



# Does "Maryland" contain one or more of "a" ?
grepl("a+", "Maryland")

# Does "Maryland" contain one or more of "x" ?
grepl("x+", "Maryland")

# Does "Maryland" contain zero or more of "x" ?
grepl("x*", "Maryland")



# Does "Maryland" contain zero or more of "x" ?
grepl("(xx)*", "Maryland")



## try it out



# Does "Mississippi" contain exactly 2 adjacent "s" ?
grepl("s{2}", "Mississippi")

# This is equivalent to the expression above:
grepl("ss", "Mississippi")

# Does "Mississippi" contain between 1 and 3 adjacent "s" ?
grepl("s{1,3}", "Mississippi")

# Does "Mississippi" contain between 2 and 3 adjacent "i" ?
grepl("i{2,3}", "Mississippi")

# Does "Mississippi" contain between 2 adjacent "iss" ?
grepl("(iss){2}", "Mississippi")

# Does "Mississippi" contain between 2 adjacent "ss" ?
grepl("(ss){2}", "Mississippi")

# Does "Mississippi" contain the pattern of an "i" followed by
# 2 of any character, with that pattern repeated three times adjacently?
grepl("(i.{2}){3}", "Mississippi")



## try it out


#| error: true
"\\d"



double_quote <- "\""
double_quote

single_quote <- "'"
single_quote



grepl("\\+", "tragedy + time = humor")

grepl("\\.", "https://publichealth.jhu.edu")



x <- c("\'", "\"", "\\")
x

writeLines(x)


#| eval: false
## ?"'"



x <- c("\\t", "\\n", "\u00b5")
x

writeLines(x)



grepl("\\w", "abcdefghijklmnopqrstuvwxyz0123456789")

grepl("\\d", "0123456789")

# "\n" is the metacharacter for a new line
# "\t" is the metacharacter for a tab
grepl("\\s", "\n\t   ")

grepl("\\d", "abcdefghijklmnopqrstuvwxyz")

grepl("\\D", "abcdefghijklmnopqrstuvwxyz")

grepl("\\w", "\n\t   ")



grepl("[aeiou]", "rhythms")



grepl("[^aeiou]", "rhythms")



grepl("[a-m]", "xyz")

grepl("[a-m]", "ABC")

grepl("[a-mA-M]", "ABC")



grepl("^a", c("bab", "aab"))

grepl("b$", c("bab", "aab"))

grepl("^[ab]*$", c("bab", "aab", "abc"))



grepl("a|b", c("abc", "bcd", "cde"))

grepl("North|South", c("South Dakota", "North Carolina", "West Virginia"))



start_end_vowel <- "^[AEIOU]{1}.+[aeiou]{1}$"
vowel_state_lgl <- grepl(start_end_vowel, state.name)
head(vowel_state_lgl)

state.name[vowel_state_lgl]


#| echo: false
library(knitr)

mc_tibl <- data.frame(
    Metacharacter =
        c(
            ".", "\\\\w", "\\\\W", "\\\\d", "\\\\D",
            "\\\\s", "\\\\S", "[xyz]", "[^xyz]", "[a-z]",
            "^", "$", "\\\\n", "+", "*", "?", "|", "{5}", "{2, 5}",
            "{2, }"
        ),
    Meaning =
        c(
            "Any Character", "A Word", "Not a Word", "A Digit", "Not a Digit",
            "Whitespace", "Not Whitespace", "A Set of Characters",
            "Negation of Set", "A Range of Characters",
            "Beginning of String", "End of String", "Newline",
            "One or More of Previous", "Zero or More of Previous",
            "Zero or One of Previous", "Either the Previous or the Following",
            "Exactly 5 of Previous", "Between 2 and 5 or Previous",
            "More than 2 of Previous"
        ),
    stringsAsFactors = FALSE
)
kable(mc_tibl, align = "c")



grepl("[Ii]", c("Hawaii", "Illinois", "Kentucky"))



grep(pattern = "[Ii]", x = c("Hawaii", "Illinois", "Kentucky"))



sub(pattern = "[Ii]", replacement = "1", x = c("Hawaii", "Illinois", "Kentucky"))



gsub("[Ii]", "1", c("Hawaii", "Illinois", "Kentucky"))



two_s <- state.name[grep("ss", state.name)]
two_s

strsplit(x = two_s, split = "ss")



library(stringr)
state_tbl <- paste(state.name, state.area, state.abb)
head(state_tbl)
str_extract(state_tbl, "[0-9]+")



str_detect(state_tbl, "[0-9]+")
grepl("[0-9]+", state_tbl)



head(state.name)
str_order(state.name)

head(state.abb)
str_order(state.abb)



str_replace(string = state.name, pattern = "[Aa]", replace = "B")
sub(pattern = "[Aa]", replacement = "B", x = state.name)



str_pad("Thai", width = 8, side = "left", pad = "-")
str_pad("Thai", width = 8, side = "right", pad = "-")
str_pad("Thai", width = 8, side = "both", pad = "-")



cases <- c("CAPS", "low", "Title")
str_to_title(cases)



to_trim <- c("   space", "the    ", "    final frontier  ")
str_trim(to_trim)



pasted_states <- paste(state.name[1:20], collapse = " ")

cat(str_wrap(pasted_states, width = 80))
cat(str_wrap(pasted_states, width = 30))



a_tale <- "It was the best of times it was the worst of times it was the age of wisdom it was the age of foolishness"

word(a_tale, 2)

word(a_tale, end = 3) # end = last word to extract

word(a_tale, start = 11, end = 15) # start = first word to extract



head(stringr::words)
length(stringr::words)



options(width = 120)
sessioninfo::session_info()

