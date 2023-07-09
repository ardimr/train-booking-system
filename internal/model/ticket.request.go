package model

type GetTicketDetailsRequestUri struct {
	TicketId int64 `uri:"ticket_id" binding:"required"`
}

type GetUserTicketsRequestParam struct {
	UserId int64 `form:"user_id" binding:"required"`
}
