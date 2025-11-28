{...}: let
  files = builtins.readDir ./.;
  names = builtins.attrNames files;
  nixFiles =
    builtins.filter
    (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames files);
  dirs =
    builtins.filter
    (name: files.${name} == "directory")
    names;
  imports = (map (name: ./. + "/${name}") nixFiles) ++ (map (name: ./. + "/${name}") dirs);
in {
  imports = imports;
}
