::Sunspot::Search::StandardSearch.class_eval do

  include Enumerable

  delegate( 
    :current_page, 
    :per_page, 
    :total_entries, 
    :total_pages, 
    :offset, 
    :previous_page, 
    :next_page, 
    :out_of_bounds?,
    :each,
    :in_groups_of,
    :blank?,
    :[],
    :to => :results)

end