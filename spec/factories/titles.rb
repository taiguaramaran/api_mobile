FactoryBot.define do
  factory :title do
    show_id {'A123'}
    show_type {'serie'}
    title {'teste'}
    director {'teste'}
    cast {'teste'}
    country {'brasil'}
    date_added {'2020-01-01'}
    release_year {2019}
    rating {3}
    duration {'90m'}
    listed_in {'tv'}
    description {'teste'}
  end
end
