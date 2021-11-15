require 'rails_helper'

describe 'Titles Api', type: :request do
  it 'returns all titles' do
    get 'https://localhost:3000/api/v1/titles'
  expect(response).to have_http_status(:success)

  end
end

describe 'POST /titles' do

  let(:url){'https://localhost:3000/api/v1/titles'}
  let(:params){{title: {show_id: '123', title:'teste', genre: 'teste', published_at:'1999', country:'brasil', listed_in:'2000', description:'teste'}}}
  it 'create status OK' do
    expect{post(url,params: params).to have_http_status(:success)}
  end

  it 'create a title' do
    expect{post(url,params: params).to change(Title, :count).by(1)}
  end

end

describe 'DELETE /titles/:id' do
  let (:title){create(:title)}
  it 'delete a title' do
    expect{delete("https://localhost:3000/api/v1/titles/#{title.id}").to change(Title, :count).by(0)}
  end
end

describe 'UPDATE /titles/:id' do
  let (:title){create(:title)}
  let(:url){"https://localhost:3000/api/v1/titles/#{title.id}"}
  let(:params){{title: {show_id: '123', title:'teste', genre: 'teste', published_at:'1999', country:'brasil', listed_in:'2000', description:'teste'}}}

  it 'update status success' do
    expect{put(url,params: params).to have_http_status(:success)}
  end

  it 'update a title' do
   expect{put(url,params: params).to change(title, :updated_at)}
  end
end
