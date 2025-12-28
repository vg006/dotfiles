{
  description = "Flake templates";
  outputs = { self }: {
    templates = {
      go = {
        path = ./go;
        description = "Go Development environment";
      };
      rs = {
        path = ./rs;
        description = "Rust Development environment";
      };
      js = {
        path = ./js;
        description = "Javascript Development environment";
      };
      py = {
        path = ./py;
        description = "Python Development environment";
      };
      zig = {
        path = ./zig;
        description = "Zig Development environment";
      };
    };
  };
}
