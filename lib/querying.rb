def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title,year from books where books.series_id = (SELECT series_id from series order by id asc limit 1) order by year asc"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name,motto from characters where motto = (SELECT motto from characters order by LENGTH(motto) desc limit 1);"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species,count(characters.species) from characters where characters.species = 'human' order by count(characters.species) desc limit 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name,subgenres.name from authors inner join series on series.author_id = authors.id INNER JOIN subgenres on subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "SELECT title,count(series.id) as thecount from series inner join characters on series.id = characters.series_id where characters.species = 'human' order by thecount desc;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT name,(SELECT COUNT() FROM books where characters.series_id = books.series_id) as booknum from characters left outer join books on characters.series_id = books.series_id GROUP BY characters.id;"
end
