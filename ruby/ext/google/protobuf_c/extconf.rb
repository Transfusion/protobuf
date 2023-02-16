#!/usr/bin/ruby

require 'mkmf'

ext_name = "google/protobuf_c"

dir_config(ext_name)

if RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
  $CFLAGS += " -std=gnu99 -O3 -DNDEBUG -fvisibility=hidden -Wall -Wsign-compare -Wno-declaration-after-statement"
else
  $CFLAGS += " -std=gnu99 -O3 -DNDEBUG"
end

$VPATH << "$(srcdir)/third_party/utf8_range"
$INCFLAGS << "$(srcdir)/third_party/utf8_range"

$srcs = ["protobuf.c", "convert.c", "defs.c", "message.c",
         "repeated_field.c", "map.c", "ruby-upb.c", "wrap_memcpy.c",
         "naive.c", "range2-neon.c", "range2-sse.c"]

create_makefile(ext_name)
