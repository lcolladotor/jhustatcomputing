
knitr::include_graphics("http://r4ds.had.co.nz/images/tidy-1.png")



knitr::include_graphics("https://www.tidytextmining.com/images/tmwr_0101.png")



## ?unnest_tokens


#| label: pengpreface
#| echo: false
#| fig-cap: 'Preface from R Programming for Data Science'
#| out-width: '90%'
knitr::include_graphics("../../images/peng_preface.png")



peng_preface <-
    c(
        "I started using R in 1998 when I was a college undergraduate working on my senior thesis.",
        "The version was 0.63.",
        "I was an applied mathematics major with a statistics concentration and I was working with Dr. Nicolas Hengartner on an analysis of word frequencies in classic texts (Shakespeare, Milton, etc.).",
        "The idea was to see if we could identify the authorship of each of the texts based on how frequently they used certain words.",
        "We downloaded the data from Project Gutenberg and used some basic linear discriminant analysis for the modeling.",
        "The work was eventually published and was my first ever peer-reviewed publication.",
        "I guess you could argue it was my first real 'data science' experience."
    )

peng_preface



library(tidyverse)
library(stringr)
library(tidytext) ## needs to be installed
library(janeaustenr) ## needs to be installed



peng_preface_df <- tibble(
    line = 1:7,
    text = peng_preface
)
peng_preface_df



peng_token <-
    peng_preface_df %>%
    unnest_tokens(
        output = word,
        input = text,
        token = "words"
    )

peng_token %>%
    head()

peng_token %>%
    tail()



peng_preface_df %>%
    unnest_tokens(word,
        text,
        token = "characters"
    ) %>%
    head()



peng_preface_df %>%
    unnest_tokens(word,
        text,
        token = "ngrams",
        n = 3
    ) %>%
    head()



peng_preface_df %>%
    unnest_tokens(word,
        text,
        token = "character_shingles",
        n = 4
    ) %>%
    head()



peng_preface_df %>%
    unnest_tokens(word,
        text,
        token = stringr::str_split,
        pattern = " "
    ) %>%
    head()



gorman_hill_we_climb <-
    c(
        "When day comes we ask ourselves, where can we find light in this neverending shade?",
        "The loss we carry, a sea we must wade.",
        "We’ve braved the belly of the beast, we’ve learned that quiet isn’t always peace and the norms and notions of what just is, isn’t always justice.",
        "And yet the dawn is ours before we knew it, somehow we do it, somehow we’ve weathered and witnessed a nation that isn’t broken but simply unfinished."
    )

hill_df <- tibble(
    line = seq_along(gorman_hill_we_climb),
    text = gorman_hill_we_climb
)
hill_df

### try it out

hill_df %>%
    unnest_tokens(
        output = wordsforfun,
        input = text,
        token = "words"
    )



library(janeaustenr)
head(prideprejudice, 20)



pp_book_df <- tibble(text = prideprejudice)

pp_book_df %>%
    unnest_tokens(
        output = word,
        input = text,
        token = "words"
    )



tmp <- pp_book_df %>%
    unnest_tokens(
        output = paragraph,
        input = text,
        token = "paragraphs"
    )
tmp



tmp[3, 1]



pp_book_df %>%
    unnest_tokens(
        output = sentence,
        input = text,
        token = "sentences"
    )



paragraphs <-
    pp_book_df %>%
    unnest_tokens(
        output = paragraph,
        input = text,
        token = "paragraphs"
    ) %>%
    mutate(paragraph_number = row_number())

paragraphs



paragraphs %>%
    unnest_tokens(
        output = word,
        input = paragraph
    )



data(stop_words)

table(stop_words$lexicon)

stop_words %>%
    head(n = 10)



words_by_paragraph <-
    paragraphs %>%
    unnest_tokens(
        output = word,
        input = paragraph
    ) %>%
    anti_join(stop_words)

words_by_paragraph



words_by_paragraph %>%
    count(word, sort = TRUE) %>%
    head()



words_by_paragraph %>%
    count(word, sort = TRUE) %>%
    filter(n > 150) %>%
    mutate(word = fct_reorder(word, n)) %>%
    ggplot(aes(word, n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip()



austen_books() %>%
    head()



original_books <-
    austen_books() %>%
    group_by(book) %>%
    mutate(
        linenumber = row_number(),
        chapter = cumsum(
            str_detect(text,
                pattern = regex(
                    pattern = "^chapter [\\divxlc]",
                    ignore_case = TRUE
                )
            )
        )
    ) %>%
    ungroup()

original_books



tidy_books <- original_books %>%
    unnest_tokens(word, text) %>%
    anti_join(stop_words)

tidy_books



tidy_books %>%
    count(word, sort = TRUE) %>%
    filter(n > 600) %>%
    mutate(word = fct_reorder(word, n)) %>%
    ggplot(aes(word, n)) +
    geom_col() +
    xlab(NULL) +
    coord_flip()



knitr::include_graphics("https://www.tidytextmining.com/images/tmwr_0201.png")



get_sentiments("nrc")



get_sentiments("bing")



get_sentiments("afinn")



nrc_joy <- get_sentiments("nrc") %>%
    filter(sentiment == "joy")

tidy_books %>%
    filter(book == "Emma") %>%
    inner_join(nrc_joy) %>%
    count(word, sort = TRUE)



tidy_books %>%
    inner_join(get_sentiments("bing"))



tidy_books %>%
    inner_join(get_sentiments("bing")) %>%
    count(book,
        index = linenumber %/% 80,
        sentiment
    )



jane_austen_sentiment <-
    tidy_books %>%
    inner_join(get_sentiments("bing")) %>%
    count(book,
        index = linenumber %/% 80,
        sentiment
    ) %>%
    pivot_wider(
        names_from = sentiment,
        values_from = n,
        values_fill = 0
    ) %>%
    mutate(sentiment = positive - negative)

jane_austen_sentiment



jane_austen_sentiment %>%
    ggplot(aes(x = index, y = sentiment, fill = book)) +
    geom_col(show.legend = FALSE) +
    facet_wrap(. ~ book, ncol = 2, scales = "free_x")



library(wordcloud)

tidy_books %>%
    anti_join(stop_words) %>%
    count(word) %>%
    with(wordcloud(word, n, max.words = 100))



knitr::include_graphics("https://www.tidytextmining.com/images/tmwr_0501.png")



tidy_austen <-
    austen_books() %>%
    mutate(line = row_number()) %>%
    unnest_tokens(word, text) %>%
    anti_join(stop_words)

tidy_austen



austen_sparse <- tidy_austen %>%
    count(line, word) %>%
    cast_sparse(row = line, column = word, value = n)

austen_sparse[1:10, 1:10]



austen_dtm <- tidy_austen %>%
    count(line, word) %>%
    cast_dtm(document = line, term = word, value = n)

austen_dtm



class(austen_dtm)
dim(austen_dtm)
as.matrix(austen_dtm[1:20, 1:10])



options(width = 120)
sessioninfo::session_info()

