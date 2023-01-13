Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5A6688C6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Jan 2023 01:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635BC10E1B7;
	Fri, 13 Jan 2023 00:56:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CE310E1B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Jan 2023 00:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673571413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XG7oCthi1cz9qA5sCXs+Yfwmmh8peH0gCPI3GPwykJs=;
 b=JvzreIi9alzklcFGDRo5do/TjaanqVRFieRK+1vcvdF4hQc2FinhJ6JljbyeHcsahp9I3X
 cBusJ9zsSZhTE7Pjqn/8vdKmL/8UOqEFu9sgFYoWuee55JjsKmt7cIZn3spoyWM64yZ1Tj
 w6X57Ufu0FRPQalsckXK1UPljTzkQo4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-FZiQFKQ4NaeG_CEWa18E3w-1; Thu, 12 Jan 2023 19:56:52 -0500
X-MC-Unique: FZiQFKQ4NaeG_CEWa18E3w-1
Received: by mail-il1-f200.google.com with SMTP id
 z8-20020a056e02088800b0030c247efc7dso14701518ils.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Jan 2023 16:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XG7oCthi1cz9qA5sCXs+Yfwmmh8peH0gCPI3GPwykJs=;
 b=f5TeqN9jXAo5yvW2eAqbljsIhySORppmtGqBCJXj71+bEFwkTH/El0q7gIATPtXLO7
 QmoAXbuh1ZxRW20jstr0lwexs9p2feMLhGVRK0fuPTYPbpep+cCiCegfLQ7PzH6C+Qof
 iFZ8mugTMNWCCWpvtV96JaXy/JhG+gIvEWUD+CsJefTyh2m0My4qNCFbT9yBnIIu8gc9
 fU+sO+7jUAkeEcT+Gco4w0uxqNmQcx+/evEhU3+EVMwx9rceNLmz3l3C1GM1iOzr5nI+
 hTfQBcqfdOhAnNJ19S7gMO13kH083isLv0CaMSs1wPlglcFPemvYLzgdBzjYy5MUXhPC
 XwgQ==
X-Gm-Message-State: AFqh2ko9IMgaxrmUn1FOQZYsczidMdw4eki5+qg4qVSYJsvJchSPjq02
 k15ZtmSSexfzptgt2zGTe2/qyQVDhVQhyPGGa8X6CD4nh/bDlupGeV7rCniVWeBt6WHn7O4z0kJ
 n4MGZe3ASfnGGJDferDOoprpf8CbJe9wzCg==
X-Received: by 2002:a5d:8c88:0:b0:6f1:f493:7240 with SMTP id
 g8-20020a5d8c88000000b006f1f4937240mr6277500ion.3.1673571411513; 
 Thu, 12 Jan 2023 16:56:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvsA3h8dnBWYocee5XN2BqUQKDNeUrvNWtFiPzDqbJBlxeKo+IUAua2OcaVeTDIIuJpIjdmug==
X-Received: by 2002:a5d:8c88:0:b0:6f1:f493:7240 with SMTP id
 g8-20020a5d8c88000000b006f1f4937240mr6277474ion.3.1673571411216; 
 Thu, 12 Jan 2023 16:56:51 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e18-20020a022112000000b0039e048ad8e7sm5624918jaa.59.2023.01.12.16.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 16:56:50 -0800 (PST)
Date: Thu, 12 Jan 2023 17:56:48 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2] vfio: fix potential deadlock on vfio group lock
Message-ID: <20230112175648.158dca5f.alex.williamson@redhat.com>
In-Reply-To: <Y8CX8YwT/T9v4U/D@google.com>
References: <20230112203844.41179-1-mjrosato@linux.ibm.com>
 <20230112140517.6db5b346.alex.williamson@redhat.com>
 <bce7912a-f904-b5a3-d234-c3e2c42d9e54@linux.ibm.com>
 <Y8CX8YwT/T9v4U/D@google.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 imbrenda@linux.ibm.com, Matthew Rosato <mjrosato@linux.ibm.com>,
 pmorel@linux.ibm.com, david@redhat.com, linux-s390@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 jgg@nvidia.com, kvm@vger.kernel.org, pbonzini@redhat.com,
 borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com, frankja@linux.ibm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 12 Jan 2023 23:29:53 +0000
Sean Christopherson <seanjc@google.com> wrote:

> On Thu, Jan 12, 2023, Matthew Rosato wrote:
> > On 1/12/23 4:05 PM, Alex Williamson wrote:  
> > > On Thu, 12 Jan 2023 15:38:44 -0500
> > > Matthew Rosato <mjrosato@linux.ibm.com> wrote:  
> > >> @@ -344,6 +345,35 @@ static bool vfio_assert_device_open(struct vfio_device *device)
> > >>  	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
> > >>  }
> > >>  
> > >> +static bool vfio_kvm_get_kvm_safe(struct kvm *kvm)
> > >> +{
> > >> +	bool (*fn)(struct kvm *kvm);
> > >> +	bool ret;
> > >> +
> > >> +	fn = symbol_get(kvm_get_kvm_safe);
> > >> +	if (WARN_ON(!fn))  
> 
> In a related vein to Alex's comments about error handling, this should not WARN.
> WARNing during vfio_kvm_put_kvm() makes sense, but the "get" is somewhat blind.

It's not exactly blind though, we wouldn't have a kvm pointer if the
kvm-vfio device hadn't stuffed one into the group.  We only call into
here if we have a non-NULL pointer, so it wouldn't simply be that the
kvm module isn't available for this to fire, but more that we have an
API change to make the symbol no longer exist.  A WARN for that doesn't
seem unreasonable.  Thanks,

Alex

> > >> +		return false;
> > >> +
> > >> +	ret = fn(kvm);
> > >> +
> > >> +	symbol_put(kvm_get_kvm_safe);
> > >> +
> > >> +	return ret;
> > >> +}
> > >> +
> > >> +static void vfio_kvm_put_kvm(struct kvm *kvm)
> > >> +{
> > >> +	void (*fn)(struct kvm *kvm);
> > >> +
> > >> +	fn = symbol_get(kvm_put_kvm);
> > >> +	if (WARN_ON(!fn))
> > >> +		return;
> > >> +
> > >> +	fn(kvm);
> > >> +
> > >> +	symbol_put(kvm_put_kvm);
> > >> +}  
> 

