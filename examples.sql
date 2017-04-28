declare
  l_elapsed_time number;
  l_captured_memory number; -- bytes
begin
  -- to get elapsed time
  probe.start_timer;
  /* first piece of code */
  l_elapsed_time := probe.elapsed_time;

  -- to get captured memory
  probe.start_mem_watcher;
  /* first piece of code */
  l_captured_memory := probe.captured_mem;
end;
