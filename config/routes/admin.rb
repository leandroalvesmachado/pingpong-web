namespace :admin, path: "administracao" do
  root "home#index"

  resources :estados, path: "estados", path_names: {
    index: "",
    show: "visualizacao",
    new: "cadastro",
    edit: "edicao",
    create: "cadastro",
    update: "atualizar",
    destroy: "deletar"
  } do
    collection do
      post "/cadastro", to: "estados#create", as: "create"
      put ":id/edicao", to: "estados#update", as: "update"
    end
  end
end
