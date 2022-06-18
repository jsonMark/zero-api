package session

import (
	"crypto/rand"
	"encoding/base64"
	"github.com/pkg/errors"
	"github.com/zeromicro/go-zero/core/stores/redis"
	"io"
	"time"
)

type Session struct {
	db        *redis.Redis
	prefix    string
	sessionId string
}

func NewSession(sessionId string, db *redis.Redis) *Session {
	if sessionId != "" {
		db.Expire(sessionId, 86400)
	}
	return &Session{
		db:        db,
		sessionId: sessionId,
	}
}

func (s *Session) CreateSession(prefix string) (string, error) {
	buf := make([]byte, 32)

	_, err := io.ReadFull(rand.Reader, buf)
	if err != nil {
		return "", err
	}

	sessionId := base64.URLEncoding.EncodeToString(buf)

	err = s.db.Hset(prefix+"_"+sessionId, "_createtime", time.Now().String())
	if err != nil {
		return "", err
	}
	s.sessionId = prefix + "_" + sessionId
	return prefix + "_" + sessionId, err
}

func (s *Session) Set(key string, value string) error {
	if s.sessionId == "" {
		return errors.New("create session first")
	}
	err := s.db.Hset(s.sessionId, key, value)
	if err != nil {
		return err
	}
	return nil
}

func (s *Session) Get(key string) (string, error) {
	if s.sessionId == "" {
		return "", errors.New("create session first")
	}
	result, err := s.db.Hget(s.sessionId, key)
	if err != nil {
		return "", err
	}
	return result, nil
}

func (s *Session) GetAll(sessionId string, key string) (map[string]string, error) {
	if s.sessionId == "" {
		return nil, errors.New("create session first")
	}
	result, err := s.db.Hgetall(s.sessionId)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (s *Session) DelSession() (int, error) {
	if s.sessionId == "" {
		return 0, errors.New("create session first")
	}
	return s.db.Del(s.sessionId)
}
