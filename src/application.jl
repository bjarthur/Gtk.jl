if gtk_version == 3
GtkApplicationLeaf(id::String, flags) = GtkApplicationLeaf(
    ccall((:gtk_application_new, libgtk), Ptr{GObject}, (Ptr{Uint8}, Cuint), bytestring(id), flags) )

function push!(app::GtkApplication, win::GtkWindow)
    ccall((:gtk_application_add_window, libgtk), Void, (Ptr{GObject}, Ptr{GObject}), app, win)
    app
end

function splice!(app::GtkApplication, win::GtkWindow)
    ccall((:gtk_application_remove_window, libgtk), Void, (Ptr{GObject}, Ptr{GObject}), app, win)
    app
end

app_menu(app::GtkApplication, app_menu::GObject) =
    ccall((:gtk_application_new, libgtk), Void, (Ptr{GObject}, Ptr{GObject}), app, app_menu)

GtkApplicationWindowLeaf(app::GtkApplication) = GtkApplicationWindowLeaf(
    ccall((:gtk_application_window_new, libgtk), Ptr{GObject}, (Ptr{GObject},), app) )
end
