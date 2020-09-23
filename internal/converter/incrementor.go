package converter

import "sync"

// Incrementer ...
type Incrementer struct {
	mu    *sync.RWMutex
	value int64
}

// NewIncrementer ...
func NewIncrementer() *Incrementer {
	return &Incrementer{
		mu:    &sync.RWMutex{},
		value: 0,
	}
}

// Increment ...
func (i *Incrementer) Increment() {
	i.mu.Lock()
	defer i.mu.Unlock()

	i.value++
}

// Get ...
func (i *Incrementer) Get() int64 {
	i.mu.RLock()
	defer i.mu.RUnlock()

	return i.value
}
