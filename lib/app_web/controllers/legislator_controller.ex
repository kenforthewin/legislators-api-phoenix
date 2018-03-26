defmodule AppWeb.LegislatorController do
  import Ecto.Query
  use AppWeb, :controller

  alias App.Legislator
  alias App.Repo

  action_fallback AppWeb.FallbackController

  def index(conn, %{
    "perPage" => per_page, 
    "page" => page, "draw" => draw,
    "sortField" => sort_field, 
    "sortDirection" => sort_direction, 
    "searchValue" => search
    }) do

    offset = (page * per_page) - per_page
    total = Repo.one(from l in Legislator, select: count(l.id))
    order_by = if sort_direction && sort_field do
      dir = String.to_atom(sort_direction)
      field = String.to_atom(sort_field)
      [{dir, field}]
    else
      []
    end
    search_ilike = if search, do: "%#{search}%", else: "%"

    total = Repo.one(from l in Legislator, 
        select: count(l.id),
        where: ilike(l.official_name, ^search_ilike))

    legislators = Repo.all(from l in Legislator,
        where: ilike(l.official_name, ^search_ilike),
        limit: ^per_page, 
        offset: ^offset,
        order_by: ^order_by)
        
    render(conn, "index.json", legislators: legislators, draw: draw, total: total )
  end

  def show(conn, %{"id" => id}) do
    legislator = Repo.get(Legislator, id)
    render(conn, "show.json", legislator: legislator)
  end
end
