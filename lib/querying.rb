def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title,year from books where books.series_id = (SELECT series.id from series order by id asc limit 1) group by books.title order by year asc"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name,motto from characters where motto = (SELECT motto from characters order by LENGTH(motto) desc limit 1);"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species,count(characters.species) from characters group by characters.species order by count(characters.species) desc limit 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name,subgenres.name from authors inner join series on series.author_id = authors.id INNER JOIN subgenres on subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "SELECT title from series inner join characters on series.id = characters.series_id where characters.species = 'human' group by series.title order by count(series.id) desc limit 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "select name, count(distinct character_books.id)
  from characters
  inner join character_books on characters.id = character_books.character_id
  group by name order by count(distinct character_books.id) desc;"
end
