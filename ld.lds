/* Default linker script, for normal executables */
OUTPUT_ARCH(i386)
ENTRY(_start)
SECTIONS
{
  /* Read-only sections, merged into text segment: */
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x08048000)); . = SEGMENT_START("text-segment", 0x08048000) + SIZEOF_HEADERS;
  .text           :
  {
  }
  .data           :
  {
  }
}
