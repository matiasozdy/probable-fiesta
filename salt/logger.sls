/root/logger.sh:
  file.managed:
    - source: salt://scripts/logger.sh
    - mode: 766

schedule_logger:
  cron.present:
    - name: /root/logger.sh;
    - user: root
    - minute: '00,30'
    - hour: '*'
    - daymonth: '*'
    - month: '*'
    - dayweek: '*'
