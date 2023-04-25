local M = {}

function M.basename(s)
	local matched_string = string.match(s, "%w+/$")

	if matched_string == "skrec/" then
		return "HOME"
	end

	return matched_string
end

function M.decorate_tite(title, active_pane)
	if active_pane.is_zoomed == true then
		title = "[Z] " .. title
	end

	return title
end

function M.concat_table(initial_table, table_to_concat)
	for _, value in ipairs(table_to_concat) do
		table.insert(initial_table, value)
	end
end

return M
