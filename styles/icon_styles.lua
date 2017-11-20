local styles = data.raw["gui-style"].default

styles["item-icon-base"] = {
  type = "checkbox_style",
  parent = "checkbox_style",
  width = 35,
  height = 35,
  hovered_background =
  {
    filename = "__core__/graphics/gui.png",
    priority = "extra-high-no-scale",
    width = 36,
    height = 36,
    x = 148
  },
  clicked_background =
  {
    filename = "__core__/graphics/gui.png",
    priority = "extra-high-no-scale",
    width = 36,
    height = 36,
    x = 185
  },
  checked =
  {
    filename = "__core__/graphics/gui.png",
    priority = "extra-high-no-scale",
    width = 36,
    height = 36,
    x = 185
  }
}
function defineStyle( name, FileNameIcon )
  local style = {
    type = "checkbox_style",
    parent = "item-icon-base",
    default_background = {
      filename = FileNameIcon,
      --scalable = false,
      scalable = false,
      width = 32,  height = 32
    },
    hovered_background = {
      filename = FileNameIcon,
      scalable = true, 
      --scalable = false,
      width = 32,  height = 32
    }
  }
  data.raw["gui-style"].default["item-icon-"..name] = style
end

function BtnDefStyle( name, FileNameIcon )
  local style = {
		type = "sprite",
    name = "btn-icon-"..name,
    filename = FileNameIcon,
     width = 32,  height = 32
  }
--  data.raw["gui-style"].default["btn-icon-"..name] = style
--  data:extend.defult["btn-icon-"..name] = style
  data:extend( { style } )

end

for typename, sometype in pairs(data.raw) do
  local _, object = next(sometype)
  if object.stack_size then
    for name, item in pairs(sometype) do
      if item.icon then
        defineStyle( name, item.icon )
--        BtnDefStyle( name, item.icon )
      end
    end
  end
end

defineStyle( "crude-oil-barrel", "__homeworld__/graphics/icons/crude-oil-barrel.png" )
--BtnDefStyle( "crude-oil-barrel", "__homeworld__/graphics/icons/crude-oil-barrel.png" )
--BtnDefStyle( "crude-oil-barrel", "__homeworld__/graphics/icons/crude-oil-barrel.png" )

--data.raw["gui-style"].default["homeworld_sprite_style"] = 
--{
--	type="button_style",
--	parent="button_style",
--	top_padding = 0,
--	right_padding = 0,
--	bottom_padding = 0,
--	left_padding = 0,
--	width = 32,
--	height = 32,
--	scalable = false,
--}
