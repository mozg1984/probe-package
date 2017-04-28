create or replace package body probe is
  
  /* Save current time to package variable
     (On 9i, use dbms_utility.get_time) */
  procedure start_timer
  is
  begin
    last_timing := dbms_utility.get_cpu_time;
  end;

  /* Grab the current time before doing anything else
     (Used get_cpu_time above and get_time here) */
  function elapsed_time return number
  is
    l_end_time pls_integer := dbms_utility.get_cpu_time;
  begin
    return mod(l_end_time - last_timing + power(2, 32), power(2, 32));
  end;
  
    -- Return the specified statistics value.
  function get_stat(p_stat in varchar2) return number
  is
    l_return number;
  begin
    select ms.value
    into l_return
    from v$mystat ms, v$statname sn
    where ms.statistic# = sn.statistic#
    and sn.name = p_stat;
    return l_return;
  end;
  
  -- Save current session pga memory to package variable
  procedure start_mem_watcher
  is
  begin
    last_stat_memory := get_stat('session pga memory');
  end;

  -- Grab the current session pga memory before doing anything else (Bytes)
  function captured_mem return number
  is
  begin
    return get_stat('session pga memory') - last_stat_memory;
  end;
  
end probe;
