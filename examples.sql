declare
  l_elapsed_time number;
  l_captured_memory number; -- bytes
begin
  -- to get elapsed time
  probe_pkg.start_timer;
  /* first piece of code */
  l_elapsed_time := probe_pkg.elapsed_time;

  -- to get captured memory
  probe_pkg.start_mem_watcher;
  /* first piece of code */
  l_captured_memory := probe_pkg.captured_mem;
end;
