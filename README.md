Small utility package for grabbing statistical data:

1. To get elapsed tipe use package like that:

    begin
      probe_pkg.start_timer;
      /* first piece of code */
      probe_pkg.elapsed_time;
    end;

2. To get captured memory (session pga memory) use package like that:

    begin
      probe_pkg.start_mem_watcher;
      /* first piece of code */
      probe_pkg.elapsed_time;
    end;
