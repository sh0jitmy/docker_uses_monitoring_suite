# ---------- build stage ----------
FROM golang:1.22-alpine AS builder

WORKDIR /app

# 依存解決をキャッシュさせる
COPY go.mod go.sum ./
RUN go mod download

COPY . .

# 静的リンク（distroless向け）
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -ldflags="-s -w" -o app

# ---------- runtime stage ----------
FROM gcr.io/distroless/base-debian12

WORKDIR /app

COPY --from=builder /app/app .

USER nonroot:nonroot

ENTRYPOINT ["/app/app"]