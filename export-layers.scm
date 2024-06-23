;; THERE IS NO GOD HERE. THESE LISPS ARE MADE OF BLOOD.
(define (export-layers filename output-path)                                              ; Define function
  (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename))))             ; Define function variables
    (define layers (gimp-image-get-layers image))                                         ; Get list of all layers
    (define layer-id 0)                                                                   ; Initialize layer-id
    (define fn "0")                                                                       ; Initiliaze layer-id-string
    (define drawable (car (gimp-image-get-active-layer image)))                           ; Initialize drawable
    (let loop ((i 0))                                                                     ; Loop with index i
      (if (= i (car layers))                                                              ; Compare i with number of layers
        (display "Finished loop")                                                         ; Stop loop
        (begin (display "Looping")                                                        ; (begin ...) is looped code
          (set! layer-id (aref (list-ref layers 1) i))                                    ; Get new layer ID
          (set! fn (string-append output-path (number->string layer-id) ".pbm"))          ; Create filename from ID
          (gimp-image-set-active-layer image layer-id)                                    ; Set active layer
          (gimp-layer-set-visible layer-id 1)                                             ; Make layer visible
          (set! drawable (car (gimp-image-get-active-layer image)))                       ; Create drawable from layer
          (if (= 1 (car (gimp-drawable-has-alpha drawable)))                              ; Check for alpha channel
            (gimp-layer-flatten layer-id))                                                ; Remove alpha channel
          (file-pbm-save 1 image drawable fn fn FALSE)                                    ; Save drawable to file
          (gimp-layer-set-visible layer-id 0)                                             ; Make layer invisible
          (loop (+ i 1))                                                                  ; Increment loop
        )
      )
    )
  )
)
