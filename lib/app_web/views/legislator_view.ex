defmodule AppWeb.LegislatorView do
  use AppWeb, :view
  alias AppWeb.LegislatorView

  def render("index.json", %{legislators: legislators, total: total, draw: draw}) do
    %{data: render_many(legislators, LegislatorView, "legislator.json"),
      totalRecords: total,
      draw: draw}
  end

  def render("show.json", %{legislator: legislator}) do
    render_one(legislator, LegislatorView, "legislator.json")
  end

  def render("legislator.json", %{legislator: legislator}) do
    %{id: legislator.id,
      official_name: legislator.official_name,
      birthday: legislator.birthday,
      thomas_id: legislator.thomas_id}
  end
end
