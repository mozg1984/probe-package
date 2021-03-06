create or replace package probe is

  -- Stores the last timing made
  last_timing number := null;
  
  -- Stores the last session pga memory
  last_stat_memory number := null;

  /* Save current time to package variable
     (On 9i, use dbms_utility.get_time) */
  procedure start_timer;

  /* Grab the current time before doing anything else
     (Used get_cpu_time above and get_time here) */
  function elapsed_time return number;
  
  -- Save current session pga memory to package variable
  procedure start_mem_watcher;

  -- Grab the current session pga memory before doing anything else (Bytes)
  function captured_mem return number;
  
end probe;
