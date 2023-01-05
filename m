Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748265F672
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Jan 2023 23:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EED710E29A;
	Thu,  5 Jan 2023 22:09:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A2510E29A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Jan 2023 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672956575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHRon4iazglsqJx0za5dkKZ1ECmTBS5D3uCSiao/wBQ=;
 b=Z8nnAsIVsplhS9AxYvOfdZwdwcEPyHOeJ6oIGWrrxmjcU8Bgw0bSKGLVBTbUvDDm+E2FXd
 vlknkPchEfmjJOz1EdXV2LagO5Lt2LMyLnO7IHXD693zGSwAyEYcZuerrWn2eJGO2l607D
 HmgAHUP5Vwhnmw+Svy2b52XkqIjiNLw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-s4EA6Sw4Mv67oIg28xuUhA-1; Thu, 05 Jan 2023 17:09:33 -0500
X-MC-Unique: s4EA6Sw4Mv67oIg28xuUhA-1
Received: by mail-il1-f199.google.com with SMTP id
 n15-20020a056e021baf00b0030387c2e1d3so10736ili.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 05 Jan 2023 14:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FHRon4iazglsqJx0za5dkKZ1ECmTBS5D3uCSiao/wBQ=;
 b=ASpnGBPEPftIUoLFzA2bHVEvothoXxvagcKmgp4fdxIfbBFOgIONSqyR8o/wKICjJc
 DLQ48sQN7JEnVhhRZAuYB5fg6XlNMtGzZMJQKBOg6wuTUmkw5vy6G26xAyeAKJnq0dOf
 qK857H7Vh9GGK+0eXtKNsK7QiV9MiL38/ZIzxTDpnVYUa3a4oOMJW/xHngzAQXqulUir
 YLvp+jVpbsCzMFQe8yu2hzPAWsyDgkJOPP8QMagfTvvrux2RYPVzSXrQbJ/fHBwpaRhD
 bNCTCods5qPUiUSmzx/oCdYTKc/+cU9Ip7FTNxGoRo83XksVKPiqeqBeWhceBvASO6+9
 jUjA==
X-Gm-Message-State: AFqh2kqYtgJ3op+aNbhCLD3raGP3P+BXdLThNY2VF4JXLJBoXWSGVXGU
 L+EP0T4ibeHPfVLvLlRWjKd0QGqmLphaVfbh4buMW0/qEwxW6biWbZTgYceoOw7FRfXsfg68X4O
 H8mOybXAmNG/ZJtjLtnHOtt3XEwkJxVWghw==
X-Received: by 2002:a5e:a609:0:b0:6e4:2893:2b33 with SMTP id
 q9-20020a5ea609000000b006e428932b33mr32962732ioi.14.1672956573262; 
 Thu, 05 Jan 2023 14:09:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5yKX/wdLm9HEyg87onxVqgfS0N/eR1/PgmgN9uAH7OlTthfhrG0MhtGAnQyZQ6XYAeeVAMA==
X-Received: by 2002:a5e:a609:0:b0:6e4:2893:2b33 with SMTP id
 q9-20020a5ea609000000b006e428932b33mr32962706ioi.14.1672956572929; 
 Thu, 05 Jan 2023 14:09:32 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5e970c000000b006e3170eeee4sm13692498ioj.6.2023.01.05.14.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 14:09:32 -0800 (PST)
Date: Thu, 5 Jan 2023 15:09:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Message-ID: <20230105150930.6ee65182.alex.williamson@redhat.com>
In-Reply-To: <20220519183311.582380-2-mjrosato@linux.ibm.com>
References: <20220519183311.582380-1-mjrosato@linux.ibm.com>
 <20220519183311.582380-2-mjrosato@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, hch@infradead.org,
 linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 jgg@nvidia.com, borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 14:33:11 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> Rather than relying on a notifier for associating the KVM with
> the group, let's assume that the association has already been
> made prior to device_open.  The first time a device is opened
> associate the group KVM with the device.
> 
> This fixes a user-triggerable oops in GVT.

It seems this has traded an oops for a deadlock, which still exists
today in both GVT-g and vfio-ap.  These are the only vfio drivers that
care about kvm, so they make use of kvm_{get,put}_kvm(), where the
latter is called by their .close_device() callbacks.

.close_device() is called holding the group->group_lock, or at the time
of this commit group->group_rwsem.  The remaining call chain looks like
this:

kvm_put_kvm
 -> kvm_destroy_vm
  -> kvm_destroy_devices
   -> kvm_vfio_destroy
    -> kvm_vfio_file_set_kvm
     -> vfio_file_set_kvm
      -> group->group_lock/group_rwsem

Any suggestions for a fix?  Thanks,

Alex

