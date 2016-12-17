# <div class=error>Time::Format::Custom::HttpDate</div>
<span class=error>1 (0 successes, 1 failures, 0 errors, 0 pending, 0 unknown)</span>

#### 001: <span class='error'>spec failed</span>
https://github.com/crystal-lang/crystal/blob/0.27.0/src/time/format/custom/http_date.cr#L12
```crystal
require "time/format/custom/http_date"
Time::Format::HTTP_DATE.parse("Sun, 14 Feb 2016 21:00:00 GMT")  # => 2016-02-14 21:00:00 UTC
Time::Format::HTTP_DATE.parse("Sunday, 14-Feb-16 21:00:00 GMT") # => 2016-02-14 21:00:00 UTC
Time::Format::HTTP_DATE.parse("Sun Feb 14 21:00:00 2016")       # => 2016-02-14 21:00:00 UTC

Time::Format::HTTP_DATE.format(Time.utc(2016, 2, 15)) # => "Mon, 15 Feb 2016 00:00:00 GMT"
```

