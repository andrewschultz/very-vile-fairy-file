#
# rhyru.py: checks vc- rhyming rules in the local CSDD table file
#

import i7

next_needed = prev_cue = ""

this_proj = i7.proj2dir()
my_file = i7.hdr(this_proj, 'ta')

with open(my_file) as file:
    for (line_count, line) in enumerate(file, 1):
        if 'vcal' in line:
            if prev_cue and prev_cue != 'vcal': print("Cue crossup line", line_count)
            prev_cue = 'vcal'
            next_needed = "already-done";
            continue
        if 'vcp' in line:
            if prev_cue and prev_cue != 'vcp': print("Cue crossup line", line_count)
            prev_cue = 'vcp'
            next_needed = "not-yet";
            continue
        if next_needed:
            if "\telse" in line: continue
            if next_needed not in line:
                print("Line", line_count," needs", next_needed, "after", prev_cue)
                continue
            next_needed = ""
            prev_cue = ""
      t      continue